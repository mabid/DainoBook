class AddGmailSkypeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :im_gmail_screen_name, :string
		add_column :users, :im_skype_screen_name, :string
  end

  def self.down
    remove_column :users, :im_gmail_screen_name
		remove_column :users, :im_skype_screen_name

  end
end
