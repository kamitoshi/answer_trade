class Video < ApplicationRecord
  belongs_to :student
  belongs_to :request, optional: true
  belongs_to :category

  has_many :watches, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :evaluations, dependent: :destroy

  enum academic_stage:{
    primary: 0, middle: 1, high: 2
  }

  validates :academic_stage, presence: true
  validates :title, presence: true
  # validates :content, presence: true
  validates :detail, presence: true, length:{maximum:500}

end
