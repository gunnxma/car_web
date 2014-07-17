require 'test_helper'

class SellControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
