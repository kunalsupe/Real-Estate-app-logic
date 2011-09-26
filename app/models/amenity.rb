class Amenity < ActiveRecord::Base  
  attr_accessible :property_id, :tar_roads, :playarea, :club_house, :swimming_pool, :party_hall, :health_club, :garden, :security, :intercom   
   belongs_to :property   
   
   
end
                
