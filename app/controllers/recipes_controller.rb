class RecipesController < ApplicationController
  def index
    #render json: Recipe.all
    # render 'recipes/index'
    @recipes = Recipe.all
  end

  def show
    # render 'recipes/show'
  end

  def new
    # render 'recipes/new'
  end

  def edit
    # render 'recipes/edit'
  end

  def update
    Recipe.find_by(params[:id])
    redirect_to :show
  end

  def destroy
    Recipe.destroy(params[:id])
    redirect_to :index
  end
end