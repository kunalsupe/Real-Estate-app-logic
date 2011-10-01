class Property < ActiveRecord::Base      
  # include Rhoconnect::Resource  
    belongs_to :user 
    has_many :specifications 
    has_many :amenities
    has_many :galleries
    has_many :floorplans
    has_many :ratings
   ajaxful_rateable :stars => 5 , :dimensions => [:speed, :beauty, :price]
validates_presence_of :city, :state, :address, :country, :price, :description, :title
    
    def self.search(search)
      if search
        where('city LIKE ? OR state LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
      else
        scoped
      end
    end
   
    def partition
      'kunal'
    end                 

    def self.rhoconnect_query(partition)
      Property.all

    end

  end
