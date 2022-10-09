class ResultsController < ApplicationController
  def create
    result = Result.new result_params

    if result.save
      redirect_to product_website_path(result.product_id, (result.website_id.to_i + 1))
    else
      render 'product/new'
    end
  end

  private

  def result_params
    params.require(:result).permit :product_id, :website_id, :url
  end
end
