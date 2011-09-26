class Property < ActiveRecord::Base
    belongs_to :user 
    has_many :specifications 
    has_many :amenities
    has_many :galleries
    has_many :floorplans
     
validates_presence_of :city, :state, :address, :country, :price, :description, :title
    
    def self.search(search)
      if search
        where('city LIKE ?', "%#{search}%")
      else
        scoped
      end
    end
   

  end
