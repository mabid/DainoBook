class GroupsController < ApplicationController


	def index
		@groups = current_user.groups
	end

	def new
		@group = Group.new
	end


	def show
		@group = Group.find(params[:id])
    @activities = @group.wall
	end

	def create
		@group = Group.create(params[:group])
    @group.save
    create_member @group,params[:users]
		flash[:notice] = "created group"
		redirect_to group_path(@group)
	end

	def destroy
		Group.find(params[:id]).delete
		flash[:notice] = "deleted group"
		redirect_to groups_url
	end


	def add_member

	end

	def create_member(g,users_list)
		members = users_list
    members << current_user.id.to_s
#		members = members.split(",")
		members.each do |member|
      puts g.id.to_s + " " + member
			mem  = Membership.create(:group_id => g.id, :user_id => member)
		end
		flash[:notice] = "addded all members"
#		redirect_to group_path(params[:group_id])
	end

	def remove_member
    puts "\n\n\n" + params.inspect + "\n\n\n"
    Membership.delete(Membership.where("user_id = ? AND group_id = ?",params[:user_id],params[:id]))
		flash[:notice] = "removed"
		redirect_to group_path(params[:group_id])
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
		activity.place = Group.find(params[:group_id])
		status.activity = activity
		status.save
		render :json => status.to_json and return
	end

	def link 
		link= Link.new(params[:link])
		activity = Activity.new(:user_id => current_user.id)
		activity.place = Group.find(params[:group_id])
		link.activity = activity
		link.save
		render :json => link.to_json and return 
	end

	def photo
    puts params.inspect
		activity = Activity.new( :user_id => current_user.id)
		activity.place = Group.find(params[:wall_group_id])
		photo = Photo.create({:activity => activity, :picture => params[:picture]})
		redirect_to '/groups/'+params[:wall_group_id]
	end

	def video
		video = Video.new(params[:video])
		activity = Activity.new(:user_id => current_user.id)
		activity.place = Group.find(params[:group_id])
		video.activity = activity
		video.save
		render :json => video.to_json and return 
	end

end
