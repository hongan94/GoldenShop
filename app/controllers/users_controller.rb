class UsersController < ApplicationController
  before_filter :set_search  
  
  def home
    @category = Category.all
    @products = Product.last(8)
    @product = Product.paginate(:page => params[:page], :per_page =>8)
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
    @category =  Category.find(params[:id])
    flash[:success] = "Category deleted"
    @category.destroy
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

def set_search
   @search = Product.ransack(params[:q])
end

end
