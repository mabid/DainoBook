class WallController < ApplicationController

	before_filter :require_user
	
	def index
		@activities = current_user.wall
	end

	def comment
#		comment = Comment.new(:comment => "wajo")
		activity = Activity.find(params[:activity_id])
		activity.comments.create(:comment => "wakp")
		activity.save
		@activities = current_user.wall
		render :action => :index
	end

	def status
		status = Status.new(params[:status])
		status.activity = Activity.new(:friend_id => current_user.id, :user_id => current_user.id)
		status.save
		render :json => status.to_json and return
	end

	def link 
		link= Link.new(params[:link])
		link.activity = Activity.new(:friend_id => current_user.id, :user_id => current_user.id)
		link.save
		render :json => link.to_json and return 
	end

	def photo
		act = Activity.new(:friend_id => current_user.id, :user_id => current_user.id)
		photo = Photo.create({:activity => act, :picture => params[:picture]})
		@activities = current_user.wall
		render :action => :index
	end

	def video
		video = Video.new(params[:video])
		video.activity = Activity.new(:friend_id => current_user.id, :user_id => current_user.id)
		video.save
		render :json => video.to_json and return 
	end

end

