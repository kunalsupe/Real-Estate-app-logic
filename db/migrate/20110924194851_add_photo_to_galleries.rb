class AddPhotoToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :photo_file_name, :string
    add_column :galleries, :photo_content_type, :string
    add_column :galleries, :photo_file_size, :integer
  end

  def self.down
    remove_column :galleries, :photo_file_size
    remove_column :galleries, :photo_content_type
    remove_column :galleries, :photo_file_name
  end
end
