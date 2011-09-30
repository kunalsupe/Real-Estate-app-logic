class AddStateToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :state, :string
  end

  def self.down
    remove_column :properties, :state
  end
end
