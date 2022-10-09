class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :type_product
      t.string :province, null: false
      t.string :district, null: false
      t.string :town, null: false
      t.string :street
      t.string :address
      t.string :area, null: false
      t.integer :price, null: false
      t.float :height, null: false
      t.float :width, null: false
      t.string :direction
      t.integer :length_street
      t.integer :count_floor
      t.integer :count_bed

      t.timestamps
    end
  end
end
