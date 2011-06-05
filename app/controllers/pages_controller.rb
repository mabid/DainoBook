class PagesController < ApplicationController

  def index
    if current_user
      redirect_to user_root_url
    else
      @user_session = UserSession.new
    end
  end


end
