require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stocks_new_url
    assert_response :success
  end

end
