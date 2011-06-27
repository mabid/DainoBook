class AddFriendToActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :friend_id, :integer
  end

  def self.down
		remove_column :activities, :friend_id
  end
end
