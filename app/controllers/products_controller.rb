class ProductsController < ApplicationController

 def new
  	  @product = Product.new
      @category= Category.all
  end

  def create
  		@product = Product.new(user_params)
  		if @product.save
  			redirect_to root_path
  		else
  			render 'new'
  		end
  end
    def show
        @categorys = Category.all
        @product =Product.find(params[:id])
        @categori = Category.find(@product.categori_id)
    end

      def index
          @categorys = Category.all
          @search = Product.ransack(params[:q])
          @products = @search.result(distinct: true)
          respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @products }
          end
          @product = @products.paginate(:page => params[:page], :per_page => 8 )
      end

  def user_params
      params.require(:product).permit(:product_name, :price, :image,
                                   :description, :categori_id)
  end

end
