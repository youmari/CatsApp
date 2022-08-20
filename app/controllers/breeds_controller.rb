class BreedsController < ApplicationController
  before_action :authenticate_user!
  def index
    @search_breed = Breed.where('name LIKE ?', "%#{capitalize}%").order(:name) if Breed.find_by('name LIKE ?', "%#{capitalize}%")
    @breeds = @search_breed || Breed.order(:name)
    @total_count = Breed.total_cats_grouped_by_breed
  end

  def destroy
    Breed.find(params[:id]).destroy!
    redirect_to breeds_path
  end

  private

  def capitalize
    params[:search].split.each(&:capitalize!).join(' ') if params[:search]
  end
end
