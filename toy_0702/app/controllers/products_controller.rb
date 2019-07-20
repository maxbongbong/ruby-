class ProductsController < ApplicationController

  before_action :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show;end

  def edit;end

  def create
    @product = Product.create(product_params)
    redirect_to product_path(product)
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def product_params
    params.require(:product).permit(:title, :body, :price, :image)
  end

  def load_object
    @product = Product.where(id: params[:id]).first
  end
end
