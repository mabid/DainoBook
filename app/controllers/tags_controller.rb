class TagsController < ApplicationController
	
	def index
		render :json => Photo.find(params["image-id".to_sym]).json_tags
	end	

	def add_tag
		tag = Tag.new(:left => params[:left], :top => params[:top])
		tag.user_id = params[:name_id]
		tag.photo_id = params[:image_id]
		tag.save
		render :json => {:result => true, :tag => tag.for_json}.to_json
	end

	def delete_tag
		Tag.find(params["tag-id".to_sym]).delete
		render :json => {:message => "success"}.to_json
	end

	def get_tags

	end

end
