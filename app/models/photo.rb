class Photo < ActiveRecord::Base

	belongs_to :album
	has_many :tags
	has_one :activity, :as => :item 

  has_attached_file :picture,
    :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
		:original => ""},
    :url => "/:class/:attachment/:id/:style_:basename.:extension" ,
    :default_url => "/:class/:attachment/missing.jpg"
	
	def json_tags
		tags = []
		self.tags.each do |tag|
			tags << tag.for_json	
		end	
		{
		:Image =>  [
			{
			:id => self.id,
			:Tags => tags
			}
		],
		:options => {
			:literals => {
				:removeTag => "Remove tag"
			},
			:tag => {
				:flashAfterCreation => true
			}
		}
	}.to_json
	end

end
