class Status < ActiveRecord::Base
	has_one :activity, :as => :item 
end
