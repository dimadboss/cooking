class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def new
    render 'users/new'
  end
end