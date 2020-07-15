class Follow < ApplicationRecord
  belongs_to :student
  belongs_to :follow, class_name: "Student"
end
