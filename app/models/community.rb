class Community < ApplicationRecord
  belongs_to :admin, class_name: "Student"
  # studentリレーション
  has_many :student_communities, dependent: :destroy
  has_many :student, through: :student_communities, source: "student"

  validates :name, presence: true
end
