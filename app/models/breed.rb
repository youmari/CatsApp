class Breed < ApplicationRecord
  self.primary_key = "id"
  has_many :cats, primary_key: :id
end