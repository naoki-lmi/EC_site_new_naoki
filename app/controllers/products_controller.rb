class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page]).search(params[:conditions],params[:search])
  end
  
  def new
  end

  def show
    @product = Product.find(params[:id])
    @stock = Stock.find(params[:id])
  end

  def create
  end
end