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
     
    def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
      data = access_token['extra']['user_hash']
      if user = User.find_by_email(data["email"])
        user
      else # Create a user with a stub password. 
        User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
      end
    end
 
end
