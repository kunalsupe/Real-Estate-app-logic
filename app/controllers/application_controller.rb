class ApplicationController < ActionController::Base
  protect_from_forgery     

  def showmypropertycount
      @property = Property.all

        if current_user
           @a = current_user.id  
            @b = Property.where(:builder_id => @a)
          
         end
      Property.count(:all, :conditions => [ "builder_id = ?", @a]) 
  end    
  
  
  def showallpropertycount
      @property = Property.all
      
      Property.count(:all) 
  end
end
