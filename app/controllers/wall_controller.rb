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
		activity = Activity.new(:user_id => current_user.id)
		activity.place = User.find(params[:wall_user_id])
		status.activity = activity
		status.save
		render :json => status.to_json and return
	end

	def link 
		link= Link.new(params[:link])
		activity = Activity.new(:user_id => current_user.id)
		activity.place = User.find(params[:wall_user_id])
		link.activity = activity
		link.save
		render :json => link.to_json and return 
	end

	def photo
		activity = Activity.new( :user_id => current_user.id)
		activity.place = User.find(params[:wall_user_id])
		photo = Photo.create({:activity => activity, :picture => params[:picture]})
		redirect_to '/users/'+params[:wall_user_id]+"/wall"
	end

	def video
		video = Video.new(params[:video])
		activity = Activity.new(:user_id => current_user.id)
		activity.place = User.find(params[:wall_user_id])
		video.activity = activity
		video.save
		render :json => video.to_json and return 
	end

end

