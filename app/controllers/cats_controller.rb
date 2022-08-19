class CatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @pagy, @cats = pagy(Cat.desc_cats)
  end

  def show
    @cats = Cat.filter_cats_by_breed(params[:id])
  end

  def destroy
    Cat.find(params[:id]).destroy!
    redirect_to cats_path
  end
end
