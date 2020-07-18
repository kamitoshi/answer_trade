class Comment < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :video

  has_many :reply_comments, dependent: :destroy
  has_many :comment_evaluations, dependent: :destroy

  validates :detail, length:{maximum:400}
end
