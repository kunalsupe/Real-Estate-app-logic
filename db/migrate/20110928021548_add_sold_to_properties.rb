class AddSoldToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :sold, :integer, :default => '0'
  end

  def self.down
    remove_column :properties, :sold
  end
end
