class CommentEvaluation < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :comment
end
