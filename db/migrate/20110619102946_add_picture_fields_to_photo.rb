class AddPictureFieldsToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :picture_file_name, :string # Original filename
    add_column :photos, :picture_content_type, :string # Mime type
    add_column :photos, :picture_file_size, :integer # File size in bytes
  end

  def self.down
#    remove_column :photos, :profile_picture_file_name
    remove_column :photos, :profile_picture_content_type 
    remove_column :photos, :profile_picture_file_size 
  end
end
