class AddFieldsToTags < ActiveRecord::Migration

  def self.up
		add_column :tags , :left, :integer
		add_column :tags , :top, :integer
  end

  def self.down
		remove_column :tags , :left
		remove_column :tags , :top
  end
end
