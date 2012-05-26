require 'rubygems'
require 'factory_girl'
require 'factory_girl_rails'

Factory.define :user do |f|


#Factory.define :valid_user, :class => User do |f|
  f.association :role
  f.first_name "System"
  f.last_name  "Admin"
  f.phone_number "1234567890"
  f.is_admin "true"
  f.role_id "1"
  f.email "admin111111@admin.com"
  f.password "test123"
  f.password_confirmation "test123"
  f.created_user_id "1"

end

Factory.define :example_user, :class => User   do |f|

  f.association :role
  f.first_name "System"
  f.last_name  "Admin"
  f.phone_number "1234567890"
  f.is_admin "true"
  f.role_id "1"
  f.email "admin1223@admin.com"
  f.password "test123"
  f.password_confirmation "test123"
  f.created_user_id "1"

end
Factory.define :false_user, :class => User   do |f|

  f.association :role
  f.first_name "Sriram"
  f.last_name  "r"
  f.phone_number "1234567890"
  f.is_admin "true"
  f.role_id "1"
  f.email "sriram@gmail.com"
  f.password "test123"
  f.password_confirmation "test123"
  f.created_user_id "1"

end



Factory.define :role do |f|
  f.name "Admin"
end
