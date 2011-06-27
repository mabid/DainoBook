class WallController < ApplicationController

	before_filter :require_user

	def status
		status = Status.new(params[:status])
		status.activity = Activity.new	
		status.save
		render :json => {:message => true, :status => status.to_json}
	end

	def link 
		link= Link.new(params[:link])
		link.activity = Activity.new	
		link.save
		render :json => {:message => true, :link => link.to_json}
	end

end

