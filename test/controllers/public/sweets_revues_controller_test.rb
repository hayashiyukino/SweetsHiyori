require "test_helper"

class Public::SweetsRevuesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_sweets_revues_new_url
    assert_response :success
  end

  test "should get index" do
    get public_sweets_revues_index_url
    assert_response :success
  end

  test "should get show" do
    get public_sweets_revues_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_sweets_revues_edit_url
    assert_response :success
  end
end
