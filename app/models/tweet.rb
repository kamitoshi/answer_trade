class Tweet < ApplicationRecord
  belongs_to :student
  belongs_to :community, optional: true

  validates :detail, presence: true
end
