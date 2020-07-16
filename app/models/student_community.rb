class StudentCommunity < ApplicationRecord
  belongs_to :student
  belongs_to :community
end
