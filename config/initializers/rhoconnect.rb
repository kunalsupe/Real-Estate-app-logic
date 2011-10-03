Rhoconnect.configure do |config|
   config.app_endpoint = 'http://housingskunaal.heroku.com'  
   config.authenticate = lambda { |credentials| 
   User.authenticate(credentials[:login], credentials[:password]) }
end