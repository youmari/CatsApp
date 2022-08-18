class Breed < ApplicationRecord
  self.primary_key = "id"
  validates :id, uniqueness: true
  validates :name, :origin, presence: true
  has_many :cats, dependent: :destroy

  scope :total_cats_grouped_by_breed, -> { Cat.group(:breed_id).count }
end