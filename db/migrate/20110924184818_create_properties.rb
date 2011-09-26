class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string :title
      t.string :address
      t.string :city
      t.string :country
      t.string :price
      t.integer :featured
      t.text :description
      t.integer :builder_id

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
