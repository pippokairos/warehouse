class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order(:reference)
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      flash[:error] = "Product not valid: #{@product.errors.full_messages.join(", ")}"
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      flash[:error] = "Product not valid: #{@product.errors.full_messages.join(", ")}"
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    flash[:success] = "Product #{@product.reference} deleted"
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(
      :reference,
      :name,
      :category,
      :price
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
