require 'rails_config'
require 'carrierwave/processing/mime_types'

CarrierWave.configure do |config|
  config.root = File.join Rails.root, "public"
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => Settings.aws_access_key_id || ENV['AWS_ACCESS_KEY_ID'],       # required
    :aws_secret_access_key  => Settings.aws_secret_access_key || ENV['AWS_SECRET_ACCESS_KEY'],       # required
    :region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'glushkova-me'                     # required
  # config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

  case Rails.env
  when "test" then
    config.storage = :file
    config.enable_processing = false

  when "production" then
    config.fog_directory  = 'glushkova-me'                     # required
  else
    config.fog_directory  = 'glushkova-me-dev'                     # required
  end
end
