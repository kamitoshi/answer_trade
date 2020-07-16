class Community < ApplicationRecord
  # studentリレーション
  has_many :student_communities, dependent: :destroy
  has_many :students, through: :student_communities, source: "student"

  belongs_to :admin, class_name: "Student"

  validates :name, presence: true
end
