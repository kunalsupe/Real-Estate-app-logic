class AddSoldToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :sold, :integer
  end

  def self.down
    remove_column :properties, :sold
  end
end
