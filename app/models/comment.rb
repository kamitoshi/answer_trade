class Comment < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :video

  validates :detail, length:{maximum:400}
end
