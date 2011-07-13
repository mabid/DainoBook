class User < ActiveRecord::Base
  acts_as_authentic
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_format_of :im_screen_name, :with => %r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i, :allow_blank => true, :message => "please enter valid msn im"
  validates_format_of :im_gmail_screen_name, :with => %r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i, :allow_blank => true
  validates_format_of :phones, :with => /\A[+-]?\d+\Z/ , :allow_blank => true
  validates_numericality_of :zip, :only_integer => true,  :allow_blank => true
  
  has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
	has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
	has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => :created_at
	has_many :friendships, :dependent => :destroy
	has_many :tags
	has_many :albums
	has_many :activities

	
	def wall
		Activity.where({:place_id => self.id, :place_type => 'User'}).order("created_at DESC");
	end
	has_many :memberships
  has_many :groups, :through => :memberships

  scope :search_by_term, lambda{|term| {:conditions => ["lower(first_name) LIKE ?", "#{term.downcase}"]} }

	def self.author(author)
    where(:author => author)
  end

  has_attached_file :profile_picture,
    :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :url => "/:class/:attachment/:id/:style_:basename.:extension" ,
    :default_url => "/:class/:attachment/missing.jpg"}
  
  def full_name
    self.first_name.capitalize + ' ' + self.last_name.capitalize
  end

  
  def before_save
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
  
  def profile_pic_small
    self.profile_picture.thumb
  end
  
	def for_tag
		{ :id => self.id,
			:name => self.full_name,
			:label => self.full_name
		}
	end
  
  def wall_activities
    ids = self.id.to_s + ","
    self.friends.each do |f|
      ids = ids + f.id.to_s + ","
    end
    ids[ids.length-1]=''
		Activity.where("place_id IN (?)",ids.split(",").collect{ |s| s.to_i }).order("created_at DESC");
	end
  
end
