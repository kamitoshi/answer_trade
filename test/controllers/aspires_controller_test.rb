require 'test_helper'

class AspiresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get aspires_new_url
    assert_response :success
  end

  test "should get edit" do
    get aspires_edit_url
    assert_response :success
  end

end
