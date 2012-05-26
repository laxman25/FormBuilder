## To change this template, choose Tools | Templates
## and open the template in the editor.
#require 'spec_helper'
#
#describe "User" do
#
#  before(:each) do
#    #    @user = Factory.build(:user)
#    #    @user = Factory.build(:example_user)
#  end
#
#  it "should create a user when the user has all valid parameters" do
#    #    @user = Factory.create(:user, :first_name => "Sriram", :last_name => "R" , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    #    #      addr = Factory.create(:address, :hno => '345345')
#    #      user = Factory.create(:user, :addr => addr)
#    #      user.addr
#    #     user = F.c(:Lnamw => )
#    #     @user = Factory.build(:user)
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.should be_valid
#    @user.save.should be_true
#  end
#
#
#  it "should not create a user when the Last name is empty" do
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.last_name = " "
#    @user.save.should  be_false
#
#  end
#
#  it "should not create a user when the First name is empty" do
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.first_name = " "
#    @user.save.should  be_false
#
#  end
#
#  it "should not create a user when the Phone Number is empty" do
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.phone_number = " "
#    @user.save.should  be_false
#
#  end
#
#   it "should not create a user when the Phone Number's length is not equal to 10" do
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.phone_number = "1234567890123"
#    @user.save.should  be_false
#
#  end
#
#  it "should not create a user when the Phone Number contains non-inetegers" do
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.phone_number = "abcdefghij"
#    @user.save.should  be_false
#
#  end
#
#  it "should not create a user when the Email is empty" do
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.email = " "
#    @user.save.should  be_false
#
#  end
#
#  it "should not create a user when password is empty" do
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.password = nil;
#    @user.password_confirmation = nil;
#
#    @user.save.should  be_false
#
#  end
#
#
#  it "should not create a user when password length is less than  6" do
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.password = "111";
#    @user.password_confirmation = "111";
#    @user.save.should  be_false
#
#  end
#
#
#  it "should not create a user when password length is greater than 20" do
#    @user = Factory.build(:user, :first_name => "Sriram", :last_name => "R " , :phone_number => "1234567890" , :email=>"abcd@gmail.com" , :password => "test123" , :password_confirmation => "test123" )
#    @user.password = "123456789123456789123456789";
#    @user.password_confirmation = "123456789123456789123456789";
#    @user.save.should  be_false
#
#  end
#
#
#  it "email shoud be uniqe" do
#    @user1 = Factory.create(:user,:first_name=> "sasideep1235", :last_name=> "ram12",
#      :phone_number=> "9014845476", :is_admin=> false, :role_id=> "2",
#      :email=> "sasideep123@live.com",:password=>"test123",:password_confirmation=>"test123" )
#
#    @user2 = Factory.build(:user,:first_name=> "sasideep1235", :last_name=> "ram12",
#      :phone_number=> "9014845476", :is_admin=> false, :role_id=> "2",
#      :email=> "sasideep123@live.com",:password=>"test123",:password_confirmation=>"test123" )
#
#    @user1.email.should eq(@user2.email)
#    @user2.should_not be_valid
#    @user2.save.should  be_false
#  end
#
#
#
#
#
#
#
#end
