class CategoriesController < ApplicationController
  def index
    para = params[:category_id]
    @products = Product.paginate(page: params[:page]).where("category_id = #{para}")
  end
end
