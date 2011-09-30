class AddBuilderToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :builder, :string
  end

  def self.down
    remove_column :properties, :builder
  end
end
