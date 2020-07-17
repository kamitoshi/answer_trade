require 'test_helper'

class ReplyTweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reply_tweets_new_url
    assert_response :success
  end

end
