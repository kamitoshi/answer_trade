class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :video

  validates :detail, length:{maximum:400}
end
