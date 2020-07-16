class StudentCommunity < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :community, optional: true
end
