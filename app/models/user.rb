class User < ActiveRecord::Base
  acts_as_authentic
  has_attached_file :profile_picture,
    :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :url => "/:class/:attachment/:id/:style_:basename.:extension" ,
    :default_url => "/:class/:attachment/missing.jpg"}
  
  def full_name
    self.first_name.capitalize + ' ' + self.last_name.capitalize
  end
end
