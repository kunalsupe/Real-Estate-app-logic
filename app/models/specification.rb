class Specification < ActiveRecord::Base     
  include Rhoconnect::Resource  
   attr_accessible :property_id, :beds, :bathrooms, :kitchens, :year_build, :floor, :condition   
   belongs_to :property      
   
   
   def partition
     'Property Manager'
   end                 

   def self.rhoconnect_query(partition)
     Specification.all

   end
   
end
