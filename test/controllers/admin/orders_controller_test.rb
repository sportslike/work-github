require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_orders_new_url
    assert_response :success
  end

end
