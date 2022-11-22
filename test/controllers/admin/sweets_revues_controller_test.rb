require "test_helper"

class Admin::SweetsRevuesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_sweets_revues_show_url
    assert_response :success
  end
end
