class AddPhotoToFloorplans < ActiveRecord::Migration
  def self.up
    add_column :floorplans, :photo_file_name, :string
    add_column :floorplans, :photo_content_type, :string
    add_column :floorplans, :photo_file_size, :integer
  end

  def self.down
    remove_column :floorplans, :photo_file_size
    remove_column :floorplans, :photo_content_type
    remove_column :floorplans, :photo_file_name
  end
end
