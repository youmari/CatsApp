class Cat < ApplicationRecord
  self.primary_key = "id"
  validates :id, uniqueness: true
  validates :url, presence: true
  belongs_to :breed

  scope :desc_cats, -> { self.all.includes(:breed).order(created_at: :desc)}
  scope :filter_cats_by_breed, -> (id) { Cat.where(breed_id: id) }
end
