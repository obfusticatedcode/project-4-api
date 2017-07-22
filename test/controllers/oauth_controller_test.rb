require 'test_helper'

class OauthControllerTest < ActionDispatch::IntegrationTest
  test "should get github" do
    get oauth_github_url
    assert_response :success
  end

end
