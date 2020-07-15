class Evaluation < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :video

  enum high_low:{
    high: 0,
    low: 1
  }
  
end
