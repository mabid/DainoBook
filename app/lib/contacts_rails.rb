require 'hpricot'
require 'digest/md5'
require File.expand_path(File.dirname(__FILE__) + '/contacts/google')
require File.expand_path(File.dirname(__FILE__) + '/contacts/windows_live')
require File.expand_path(File.dirname(__FILE__) + '/contacts/yahoo')

module Contacts
  module Imports
    def import_live_contacts
      live = Contacts::WindowsLive.new
      post_body = request.raw_post
      if post_body.empty?
        redirect_to live.get_authentication_url
      else
        @contacts = live.contacts(post_body)
        render "import"
      end
    end

    def import_google_contacts
      param_token = params[:token]
      if param_token.nil?
        redirect_to Contacts::Google.authentication_url(url_for(:action => action_name), :session => true)
      else
        @contacts = Contacts::Google.new("default", param_token).contacts
        render "import"
      end
    end

    def import_csv_contacts
      lines = params[:csv_file].read.lines
      header = split(lines.first).map { |item| item.strip }
      @contacts = []
      lines.each do |line|
        next if line == lines.first
        items = split(line)
        @contacts << [get(items, header, :name), get(items, header, :email)]
      end
      render "import"
    end

    def import_yahoo_contacts
      yahoo = Contacts::Yahoo.new
      param_token = params[:appid]
      if param_token.nil?
        redirect_to yahoo.get_authentication_url
      else
        @contacts = yahoo.contacts(request.request_uri)
        render "import"
      end
    end

    private
      def get(collection, header, key)
        collection[header.index(key.to_s)].strip
      end

      def split(text)
        text.split(",")
      end
  end
end

