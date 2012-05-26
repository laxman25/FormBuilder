class UserSession < Authlogic::Session::Base
  #validates :email,:password ,:presence =>true
  #   validates :first_name,:last_name,:email,:phone_number,:password,:password_confirmation ,:presence => true
   
  # configuration here, see documentation for sub modules of Authlogic::Session
end