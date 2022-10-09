class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.new
    @product.product_images.new
  end

  def create
    @product = Product.new params_product

    if @product.save
      redirect_to product_website_path(@product, Website.first)
    else
      render :new
    end
  end

  private

  def params_product
    params.require(:product).permit(:name, :phone, :title, :description, :province, :district, :town, :type_product, :direction,
      :street, :address, :price, :area, :width, :length, :height, :length_street, :count_floor, :count_bed, product_images_attributes: [:image])
  end
end
