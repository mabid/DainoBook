class WallController < ApplicationController

	before_filter :require_user
	
	def index
		@activities = current_user.wall
	end


	def show
		@wall_user_id = params[:user_id];
		@wall_user = User.find(params[:user_id])
		@activities = User.find(params[:user_id]).wall
	end

	def comment
#		comment = Comment.new(:comment => "wajo")
		activity = Activity.find(params[:activity_id])
		activity.comments.create(:comment => params[:comment], :user_id => current_user.id)
		activity.save
		@activities = current_user.wall
		render :json => activity.to_json and return 
	end

	def user_status
		status = Status.new(params[:status])
		status.activity = Activity.new(:friend_id => params[:wall_user_id], :user_id => current_user.id)
		status.save
		render :json => status.to_json and return
	end

	def link 
		link= Link.new(params[:link])
		link.activity = Activity.new(:friend_id => params[:wall_user_id], :user_id => current_user.id)
		link.save
		render :json => link.to_json and return 
	end

	def photo
		act = Activity.new(:friend_id => params[:wall_user_id], :user_id => current_user.id)
		photo = Photo.create({:activity => act, :picture => params[:picture]})
		redirect_to '/users/'+params[:wall_user_id]+"/wall"
	end

	def video
		video = Video.new(params[:video])
		video.activity = Activity.new(:friend_id => params[:wall_user_id], :user_id => current_user.id)
		video.save
		render :json => video.to_json and return 
	end

end

