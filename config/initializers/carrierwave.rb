require 'carrierwave/orm/activerecord'


 CarrierWave.configure do |config|  
 	config.root = Rails.root.join('tmp') 
    config.cache_dir = 'carrierwave' 
 	config.fog_credentials = {    
 	  :provider => 'AWS',    
 	  :aws_access_key_id => ENV['AWS_KEY'],   
 	  :aws_secret_access_key => ENV['AWS_SECRET_KEY'],    
 	  :region => 'us-west-2'  
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME'] 
  end 