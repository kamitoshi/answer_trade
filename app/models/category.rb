class Category < ApplicationRecord
  has_many :videos, dependent: :nullify
  has_many :requests, dependent: :nullify
end
