class ProductImage < ApplicationRecord
  belongs_to :product, inverse_of: :product_images
  mount_uploader :image, ImageUploader

  def full_url
    "http://localhost:3000" + image_url
  end
end
