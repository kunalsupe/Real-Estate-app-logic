class Amenity < ActiveRecord::Base  
  include Rhoconnect::Resource  
  attr_accessible :property_id, :tar_roads, :playarea, :club_house, :swimming_pool, :party_hall, :health_club, :garden, :security, :intercom   
   belongs_to :property   

def partition
  'Property Manager'
end                 

def self.rhoconnect_query(partition)
  Amenity.all
  
end
   
end
                
