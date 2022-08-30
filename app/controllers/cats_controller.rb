class CatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @pagy, @cats = pagy(Cat.desc_cats)
  end

  def show
    @cats = Cat.filter_cats_by_breed(params[:id])
  end

  def destroy
    @cat = Cat.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to cats_path, notice: 'Cats was successfully destroyed.' }
      format.turbo_stream { flash.now[:notice] = 'Cats was successfully destroyed.' }
    end
  end
end
