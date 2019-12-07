class ProductRecipesController < ApplicationController
  def index
    render json: ProductRecipe.all
  end
end