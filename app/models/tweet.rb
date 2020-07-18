class Tweet < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :community

  has_many :reply_tweets, dependent: :destroy
  has_many :tweet_evaluations, dependent: :destroy

  validates :detail, presence: true
end
