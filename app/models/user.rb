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
  #case omniauth['provider']
   # when 'facebook'
    #  self.apply_facebook(omniauth)   
     # when 'twitter'
        self.email = omniauth['user_info']['email'] if email.blank?
          authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
 

      # when 'linked-in'
       #  self.email = omniauth['user_info']['email'] if email.blank?
        #   authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      
 # end   
         
 
 

  
end  
  
  
  def facebook
    @fb_user ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token)
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
     
         protected

    def apply_facebook(omniauth)
      if (extra = omniauth['extra']['user_hash'] rescue false)
        self.email = (extra['email'] rescue '')
      end
    end
 
end
