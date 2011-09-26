class Specification < ActiveRecord::Base  
   attr_accessible :property_id, :beds, :bathrooms, :kitchens, :year_build, :floor, :condition   
   belongs_to :property
end
