class UsersController < ApplicationController

  def index
    render :text => "action not permitted L par charho"
  end
  
  def home
  end

  def new
    @user = User.new
  end

  def basic_info
    @user = current_user
  end

  def profile_pic 
    @user = current_user
  end

  def activities_interests
    @user = current_user
  end

  def contact_info
    @user = current_user
  end

  def education_work 
    @user = current_user
  end
	
  def sports
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account has been created"
      redirect_to '/profile_steps/invite_friends'
    else
      render :action => :new
    end
  end

	def edit_profile
		
	end
  
  def update
    check = params[:user]
    if current_user.update_attributes(params[:user])
      @user = current_user
      if(check[:profile_picture])
         redirect_to root_url and return 
			elsif (check[:location])
        render '/profile_steps/profile_picture' and return
			else
					flash[:notice] = "Update Successfull"
         redirect_to root_url and return 
      end
    else 
      if(check[:profile_picture])
         @user = current_user
        render '/profile_steps/profile_picture' and return
			elsif (check[:location])
        render '/profile_steps/profile_info' and return
			else
					flash[:notice] = "Failed some error Occured"
         redirect_to root_url and return 
      end
    end
  end
  

  def edit
  end
    
#  def show
#    
#  end

end
