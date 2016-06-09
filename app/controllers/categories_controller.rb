class CategoriesController < ApplicationController
 def new
      @category= Category.new  
  end

  def create
  		@category = Category.new(user_params)
  		if @category.save
        flash[:success] = "Add Category sucessful!"
  			redirect_to new_category_path
  		else
  			render 'new'
  		end
  end

  def index

  end

  def show
    @category = Category.find(params[:id])
    @categorys = Category.all
    @product = Product.where(categori_id: @category)
   @products = Product.paginate(:page => params[:page], :per_page =>8)

  end

  def user_params
      params.require(:category).permit(:name)
  end

  def destroy
      
  end
end
