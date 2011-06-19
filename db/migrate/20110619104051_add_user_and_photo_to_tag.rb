class AddUserAndPhotoToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :user_id, :integer
    add_column :tags, :photo_id, :integer
  end

  def self.down
    remove_column :tags, :user_id
    remove_column :tags, :photo_id
  end
end
