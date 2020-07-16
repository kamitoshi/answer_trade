class Community < ApplicationRecord
  # studentリレーション
  has_many :student_communities, dependent: :destroy
  has_many :student, through: :student_communities, source: "student"

  validates :name, presence: true
end
