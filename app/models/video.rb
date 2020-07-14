class Video < ApplicationRecord
  belongs_to :student
  belongs_to :request, optional: true
  belongs_to :category

  has_many :watches, dependent: :destroy

  enum academic_stage:{
    primary: 0, middle: 1, high: 2
  }

  validates :academic_stage, presence: true
  validates :title, presence: true
  # validates :content, presence: true
  validates :detail, presence: true, length:{maximum:500}

  def watched?
    self.watches.find_by(student_id: current_student.id)
  end

end
