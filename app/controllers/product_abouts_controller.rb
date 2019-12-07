class ProductAboutsController < ApplicationController
  def index
    render json: ProductAbout.all
  end
end