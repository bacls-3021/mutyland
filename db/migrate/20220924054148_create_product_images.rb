class CreateProductImages < ActiveRecord::Migration[6.1]
  def change
    create_table :product_images do |t|
      t.references :product
      t.string :url_image, null: false

      t.timestamps
    end
  end
end
