require 'test_helper'

class ToneAnalyzerControllerTest < ActionDispatch::IntegrationTest
  test "should get tone" do
    get tone_analyzer_tone_url
    assert_response :success
  end

end
