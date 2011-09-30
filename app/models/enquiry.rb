class Enquiry < ActiveRecord::Base      
  include Rhoconnect::Resource  
  
  def partition
    'Property Manager'
  end                 

  def self.rhoconnect_query(partition)
    Enquiry.all

  end
end
