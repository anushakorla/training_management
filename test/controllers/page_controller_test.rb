require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get instruction" do
    get :instruction
    assert_response :success
  end

end
