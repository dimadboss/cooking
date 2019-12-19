class RecipesController < ApplicationController
  def index
    #render json: Recipe.all
    # render 'recipes/index'
    @recipes = Recipe.all
  end

  def show
    # render 'recipes/show'
    @recipes = Recipe.find_by(params[:id])
  end

  def new
    # render 'recipes/new'
  end

  def edit
    # render 'recipes/edit'
  end

  def update
    recipe = Recipe.find_by(params[:id])
    recipe.update_columns(params)
    redirect_to :show
  end

  def destroy
    Recipe.destroy(params[:id])
    redirect_to :index
  end
end