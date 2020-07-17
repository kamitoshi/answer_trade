class ReplyTweet < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :tweet

  validates :detail, presence: true
end
