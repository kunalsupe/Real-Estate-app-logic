class Gallery < ActiveRecord::Base         
   attr_accessible :title, :photo, :property_id, :photo_file_name, :photo_content_type, :photo_file_size 
   belongs_to :property
   Max_Attachments = 5
   validates_presence_of :photo, :photo_file_name  
  has_attached_file :photo,
         :styles => {
         :thumb => "100x100#",
         :small  => "400x400>" },
         :url => "/assets/gallery/photos/:id/:style/:basename.:extension",  
         :path => ":rails_root/public/assets/gallery/photos/:id/:style/:basename.:extension"
end                   


