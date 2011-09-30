class CreateSpecifications < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.integer :beds
      t.integer :bathrooms
      t.integer :kitchens
      t.string :year_build
      t.integer :floor
      t.string :condition
      t.integer :property_id

      t.timestamps
    end
  end

  def self.down
    drop_table :specifications
  end
end
