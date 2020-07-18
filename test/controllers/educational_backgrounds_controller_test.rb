require 'test_helper'

class EducationalBackgroundsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get educational_backgrounds_new_url
    assert_response :success
  end

  test "should get edit" do
    get educational_backgrounds_edit_url
    assert_response :success
  end

end
