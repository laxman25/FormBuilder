# Load the rails application
require File.expand_path('../application', __FILE__)
#require 'gruff'
# Initialize the rails application
Trunk::Application.initialize!
# config.action_mailer.delivery_method = :smtp
#config.action_mailer.delivery_method = :smtp
#require 'gruff'
#ActionMailer::Base.server_settings = {   :address => "noreply@binarylogic.com",
#require 'gruff'
#   :port => 25,   :user_name => "username",   :password => "password",   :authentication => :plain }