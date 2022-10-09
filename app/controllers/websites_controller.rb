class WebsitesController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find_by(id: params[:product_id])
    @website = Website.find_by(id: params[:id])

    #redirect to trang ket qua
    redirect_to root_path if @product.blank? || @website.blank?

    @action = params[:act] || "create"
  end
end
