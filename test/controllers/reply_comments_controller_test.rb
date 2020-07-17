require 'test_helper'

class ReplyCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reply_comments_new_url
    assert_response :success
  end

end
