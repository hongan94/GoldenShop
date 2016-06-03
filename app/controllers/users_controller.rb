class UsersController < ApplicationController
  def index
  end

  def home
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
  end

end
