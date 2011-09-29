class ContactsController < ApplicationController    
before_filter :authenticate_user! 
before_filter do 
    redirect_to root_path unless current_user && current_user.admin?
  end

def index
   
     @contacts = Contact.find(:all)
   
 end
 
 def show
   @contact = Contact.find(params[:id]) 
 end  

 def destroy
   @contact = Contact.find(params[:id])
   @contact.destroy
   flash[:notice] = "Successfully destroyed project."
   redirect_to contacts_url
 end

 end