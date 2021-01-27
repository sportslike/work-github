require 'test_helper'

class Admin::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_order_details_new_url
    assert_response :success
  end

end
