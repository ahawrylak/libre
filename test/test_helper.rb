ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  # Add more helper methods to be used by all tests here...



end

class ActionDispatch::IntegrationTest

  def sign_in(user, password: 'testpassword', remember_me: '0')
    post user_session_path, params: { user: { email: user.email,
                                         password: password,
                                         remember_me: remember_me } }

  end

  def is_signed_in?
    !session[:user_id].nil?
  end

end
