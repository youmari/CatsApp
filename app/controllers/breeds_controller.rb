class BreedsController < ApplicationController
  before_action :authenticate_user!
  def index
    @search_breed = Breed.where("name LIKE ?", "%#{capitalize}%") if Breed.find_by("name LIKE ?", "%#{capitalize}%")
    @breeds = @search_breed || Breed.all.includes(:cats).order(:name)
    @total_count = Breed.total_cats_grouped_by_breed
  end

  def destroy
    Breed.find(params[:id]).destroy!
    redirect_to breeds_path
  end

  private
  def capitalize
    if params[:search]
      serach_word = params[:search].split(' ').each  {|word| word.capitalize! }.join(' ')
    end
  end 
end
