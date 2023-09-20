require "test_helper"

class GntUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gnt_users_index_url
    assert_response :success
  end

  test "should get show" do
    get gnt_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get gnt_users_edit_url
    assert_response :success
  end
end
