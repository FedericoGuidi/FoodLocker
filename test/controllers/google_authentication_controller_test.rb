require 'test_helper'

class GoogleAuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get google_authentication_new_url
    assert_response :success
  end

end
