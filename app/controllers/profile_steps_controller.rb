class ProfileStepsController < ApplicationController
  
  before_filter :require_user
  
  def invite_friends
   # render :text=>"wajjo"
   @friends = "wajo 1 wajo 2"
  end
  
  def profile_info
    #render :text=>"Profile info"
    @user = current_user
  end
  
  def profile_picture
    @user = current_user
  end

  
end
