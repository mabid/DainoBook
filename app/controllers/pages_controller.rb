class PagesController < ApplicationController

  layout "main_page"
  
  def index
    if current_user
      redirect_to user_root_url
    else
      @user_session = UserSession.new
	  @user = User.new
    end
  end


end
