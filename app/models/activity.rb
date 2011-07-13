class Activity < ActiveRecord::Base
	belongs_to :item, :polymorphic => true
	belongs_to :user
	belongs_to :place, :polymorphic => true
#	belongs_to :friend, :class_name => 'User', :foreign_key =>'friend_id'

	acts_as_commentable

	def friend
    self.place
	end
end
