require 'test_helper'

class MyPositionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_positions_new_url
    assert_response :success
  end

  test "should get edit" do
    get my_positions_edit_url
    assert_response :success
  end

end
