class ReplyComment < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :comment

  validates :detail, presence: true
end
