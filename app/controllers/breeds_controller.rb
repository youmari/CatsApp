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
    @breed = Breed.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to breeds_path, notice: 'Breed and its cats was successfully destroyed.' }
      format.turbo_stream { flash.now[:notice] = 'Breed and its cats was successfully destroyed.' }
    end
  end

  private

  def capitalize
    params[:search].split.each(&:capitalize!).join(' ') if params[:search]
  end
end
