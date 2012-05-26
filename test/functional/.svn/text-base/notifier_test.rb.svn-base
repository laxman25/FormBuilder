require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  include Rails.application.routes.url_helpers
def default_url_options
Rails.application.config.action_mailer.default_url_options
end 

  test "forgot_password" do
mail = Notifier.forgot_password
assert_match password_reset_url(user.perishable_token), mail.body.encoded
end
end
