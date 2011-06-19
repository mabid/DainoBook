class AlbumsController < ApplicationController

	before_filter :require_user

	def index
		@albums = current_user.albums
	end

	def show
		@album = current_user.albums.find(params[:id])
	end

	def create
		current_user.albums.create(params[:album])
		render :text => "album created"
	end

	def new
		@album = Album.new
	end
end
