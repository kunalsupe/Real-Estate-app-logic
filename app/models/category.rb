class Category < ActiveRecord::Base       
  include Rhoconnect::Resource  
  belongs_to :property         
  
  def partition
    'Property Manager'
  end                 

  def self.rhoconnect_query(partition)
    Category.all

  end
end
