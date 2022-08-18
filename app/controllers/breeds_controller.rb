class BreedsController < ApplicationController
  def index
    @breeds = Breed.all.includes(:cats).order(:name)
    @total_count = Breed.total_cats_grouped_by_breed
  end
end
