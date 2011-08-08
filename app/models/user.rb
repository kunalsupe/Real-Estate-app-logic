class User < ActiveRecord::Base
  has_many :authentications
  has_many :books
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  
  def self.create_with_omniauth(omniauth)  
      create! do |user|  
        user.provider = omniauth["provider"]  
      #  user.uid = omniauth["uid"]  
       # user.name = omniauth["user_info"]["name"]  
      end  
    end     
  
  def password_required?
    (authentications.empty? || !password.blank?) && super  
    end                                                
         
      def update_with_password(params={}) 
      if params[:password].blank? 
        params.delete(:password) 
        params.delete(:password_confirmation) if 
    params[:password_confirmation].blank? 
      end 

      update_attributes(params) 
    end
  
 
end
