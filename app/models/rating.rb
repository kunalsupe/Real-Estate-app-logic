class Rating < ActiveRecord::Base    
#  include Rhoconnect::Resource  
  belongs_to :property          
  
  def partition
    'Property Manager'
  end                 

  def self.rhoconnect_query(partition)
    Rating.all

  end
  
end
