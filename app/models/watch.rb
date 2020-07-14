class Watch < ApplicationRecord
  belongs_to :student
  belongs_to :video
end
