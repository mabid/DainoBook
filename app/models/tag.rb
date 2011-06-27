class Tag < ActiveRecord::Base
	belongs_to :user
	belongs_to :photo


	def for_json
		{
			:id => self.id,
			:text => self.user.full_name,
			:left => self.left,
			:top => self.top,
			:url =>  "/search/user?id=#{self.user.id}",
			:isDeleteEnable =>  true
		}
	end

end
