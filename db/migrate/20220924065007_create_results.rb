class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :product
      t.references :website

      t.string :url

      t.timestamps
    end

    change_table :products do |t|
      t.string :account, unique: true, null: false
    end
  end
end
