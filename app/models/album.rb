class Album < ActiveRecord::Base
	belongs_to :user
	has_many :photos


	def cover_photo
		(self.photos.count > 0) ? self.photos.find(:first).picture.url(:small) : 'default_avatar.jpg'
	end
end
