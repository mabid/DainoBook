class User < ActiveRecord::Base
  acts_as_authentic

	has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
	has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
	has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => :created_at
	has_many :friendships, :dependent => :destroy

  scope :search_by_term, lambda{|term| {:conditions => ["lower(first_name) LIKE ?", "#{term.downcase}"]} }

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
