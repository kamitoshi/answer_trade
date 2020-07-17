class ReplyTweet < ApplicationRecord
  belongs_to :student
  belongs_to :tweet
end
