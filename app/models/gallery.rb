class Gallery < ActiveRecord::Base             
  include Rhoconnect::Resource  
   attr_accessible :title, :photo, :property_id, :photo_file_name, :photo_content_type, :photo_file_size 
   belongs_to :property
   Max_Attachments = 5
   validates_presence_of :photo, :photo_file_name  
  
  has_attached_file :photo,
         :styles => {
         :thumb => "100x100#",
         :small  => "400x400>" }, 
         :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
         :url => "/assets/gallery/photos/:id/:style/:basename.:extension",  
         :path => ":rails_root/public/assets/gallery/photos/:id/:style/:basename.:extension"


         def partition
           'Property Manager'
         end                 

         def self.rhoconnect_query(partition)
           Gallery.all

         end
         
end                   


