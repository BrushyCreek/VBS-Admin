require 'test_helper'

class KidsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get kids_new_url
    assert_response :success
  end

end
