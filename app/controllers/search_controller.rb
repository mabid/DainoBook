class SearchController < ApplicationController
	before_filter :require_user
	def people
#		@users = User.search_by_term(params[:term])
		@users = User.find(:all);
	end

	def tags
		data = []	
		(current_user.friends<<current_user).each do |user|
			data << user.for_tag	
		end
		render :json => data.to_json
	end
end
