class EditProfile < ActiveRecord::Base
  has_one :activity, :as => :item 
end
