require 'test_helper'

class AuthenticationsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get authentications_login_url
    assert_response :success
  end

end
