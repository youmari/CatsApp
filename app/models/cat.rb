class Cat < ApplicationRecord
  self.primary_key = "id"
  belongs_to :breed, primary_key: :id
end
