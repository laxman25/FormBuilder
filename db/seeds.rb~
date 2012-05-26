# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["System-Admin", "Administrator", "user"].each { | role |
  Role.find_or_create_by_name(role)
}

User.create(:first_name=>"System",:last_name=>"Admin",:phone_number=>"1234567891",:is_admin=>true,:role_id=>"1",:email=>"admin@admin.com",:password=>"admin1",:password_confirmation=>"admin1")

