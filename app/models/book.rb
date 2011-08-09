class Book < ActiveRecord::Base 
  belongs_to :user
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
