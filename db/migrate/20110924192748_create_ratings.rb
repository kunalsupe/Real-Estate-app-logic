class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :rate, :default => 0
      t.string :comment_title
      t.string :comment
      t.integer :approved
      t.integer :property_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
