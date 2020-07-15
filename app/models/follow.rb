class Follow < ApplicationRecord
  belongs_to :student
  belongs_to :follow, class_name: "Student"

  validates :student_id, presence: true, :uniqueness => {:scope => :follow_id}
  validates :follow_id, presence: true
end
