class Video < ActiveRecord::Base
	has_one :activity, :as => :item 
	
	def embed_url
		self.url.gsub("watch?v=", "embed/")
	end

end
