class Group < ActiveRecord::Base
	has_and_belongs_to_many :users

	def wall
		Activity.where(:place_id => self.id, :place_type => 'Group').order("created_at DESC")
	end
  
  def full_name
    self.name
  end
end