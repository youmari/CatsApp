class CatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @pagy, @cats = pagy(Cat.desc_cats)
  end
end
