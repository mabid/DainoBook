class SearchController < ApplicationController
	before_filter :require_user
	def people
#		@users = User.search_by_term(params[:term])
		@users = User.find(:all);
	end
end
