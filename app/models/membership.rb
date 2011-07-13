class Membership < ActiveRecord::Base
	belongs_to :group
	belongs_to :user
#  attr_accessor :group_id,:user_id
end
