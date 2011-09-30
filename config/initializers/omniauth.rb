require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'TUKfXMe3mf4JDUdJIuS7g', 'hzH2nOK2PWQRPolOnJUm3dJzOImjH6YhvOyfUmbN7o'
  provider :facebook,'224567324265745', '29b03854dfc3afd54cce2af7ceed95d0',{:scope => 'publish_stream,offline_access,email'}
  provider :linked_in,'sh1otye06apa', 'XxzzldATHdFinbwE'
  
  provider :open_id, OpenID::Store::Filesystem.new('/tmp') 

end
