class User < ActiveRecord::Base
  belongs_to  :role
  acts_as_authentic do |c|
    has_many :responses

#    c.transition_from_crypto_providers = Authlogic::CryptoProviders::MD5
#    c.crypto_provider = Authlogic::CryptoProviders::Sha1
#   c.validate_email_field = false
#    c.require_password_confirmation = false
#    c.ignore_blank_passwords = true
#    c.validate_password_field = false
    #c.validate_password_field = false
#    c.validate_email_field = false
    validates :first_name,:last_name,:email,:phone_number,:presence => true
    validates :password_confirmation ,:presence => true ,:on=>:create
    #validates :email, :email_format => true
    validates :email, :uniqueness => true
    validates :phone_number, :numericality => { :only_integer => true }
    validates :phone_number, :length => {:is => 10}
    validates :password, :presence =>true, :length => { :minimum => 6, :maximum => 20 },:on=>:create

#    validates :password,:length => {:within => 8..16}
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end  # block optional

#  def send_forgot_password!
##  deactivate!
#  reset_perishable_token!
#  Notifier.forgot_password(self).deliver
#end

  def self.user_create(params_user, current_user)
    
  new(params_user.merge!({:role_id => current_user.is_admin ? 2 : 3, :created_user_id => current_user.id}))
    #new(params_user.merge!({:role_id => 3, :created_user_id => 1}))
  end
#    @user.password  = "test123"
#    @user.password_confirmation  = "test123"

  scope :temp_scope , :conditions => {:role_id => [1,2,3]}
  def self.user_findout_user(current_user)
   self.where("role_id = ? and  created_user_id = ?","3", current_user.id)
  end
 
#@posts = Post.where(["created_at >= ?", Time.current])
end
