class BrandsController < ApplicationController
  def index
    para = params[:brand_id]
    @products = Product.paginate(page: params[:page]).where("brand_id = #{para}")
  end
end
