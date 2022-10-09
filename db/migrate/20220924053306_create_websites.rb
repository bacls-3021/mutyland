class CreateWebsites < ActiveRecord::Migration[6.1]
  def change
    create_table :websites do |t|
      t.string :url, null: false
      t.string :template, null: false

      t.timestamps
    end
  end
end
