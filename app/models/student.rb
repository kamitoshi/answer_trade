class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum grade:{
    p_1: 1, p_2: 2, p_3: 3, p_4: 4, p_5: 5, p_6: 6,
    m_1: 7, m_2: 8, m_3: 9, h_1: 10, h_2: 11, h_3: 12, other: 13
  }

  validates :name, presence: true
  validates :grade, presence: true

end
