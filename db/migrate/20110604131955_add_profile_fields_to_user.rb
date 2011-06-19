class AddProfileFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :location, :string
    add_column :users, :phone, :string
  end

  def self.down
    remove_column :users, :location
    remove_column :users, :phone

  end
end
