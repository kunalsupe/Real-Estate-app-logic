class CreateAmenities < ActiveRecord::Migration
  def self.up
    create_table :amenities do |t|
      t.string :playarea
      t.string :tar_roads
      t.string :club_house
      t.string :swimming_pool
      t.string :party_hall
      t.string :health_club
      t.string :garden
      t.string :security
      t.string :intercom
      t.string :property_id

      t.timestamps
    end
  end

  def self.down
    drop_table :amenities
  end
end
