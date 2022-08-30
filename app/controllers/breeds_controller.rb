class BreedsController < ApplicationController
  before_action :authenticate_user!
  def index
    @breeds = if Breed.find_by('name LIKE ?', "%#{capitalize}%")
                Breed.where('name LIKE ?', "%#{capitalize}%").order(:name)
              else
                Breed.order(:name)
              end
    @total_count = Breed.total_cats_grouped_by_breed
  end

  def destroy
    Breed.find(params[:id]).destroy!
    redirect_to breeds_path, notice: 'The Breed and its cats was deleted successfully'
  end

  private

  def capitalize
    params[:search].split.each(&:capitalize!).join(' ') if params[:search]
  end
end
