require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'GbaVaLd5DkFQTEX4IfKkA', 'zU2V3aLqImFWpEH0NfWwinGHopr0sPNtkfmzgZFSTiQ'
  provider :facebook,'147998438615101', 'd4c6649e2b4392db5b1021a075c9b837', :site => 'https://graph.facebook.com'
  provider :linked_in,'ptze5b1nz195', 'HxGiZGKm8PEms1Nh'
  
  provider :open_id, OpenID::Store::Filesystem.new('/tmp') 

end
