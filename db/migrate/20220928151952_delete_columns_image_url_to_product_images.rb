class DeleteColumnsImageUrlToProductImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :product_images, :url_image
  end
end
