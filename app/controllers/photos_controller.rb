class PhotosController < ApplicationController

	before_filter :require_user

	def index
		render :json => current_user.albums.find(params[:album_id]).photos.to_json
	end

	def show
		@photo = current_user.albums.find(params[:album_id]).photos.find(params[:id])
	end

	def new
		@photo = Photo.new
	end

	def create
		current_user.albums.find_by_id(params[:album_id]).photos.create(params[:photo])
		redirect_to user_album_path(current_user, params[:album_id])
	end
end
