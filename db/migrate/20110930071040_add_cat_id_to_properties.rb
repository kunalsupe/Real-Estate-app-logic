class AddCatIdToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :cat_id, :integer
  end

  def self.down
    remove_column :properties, :cat_id
  end
end
