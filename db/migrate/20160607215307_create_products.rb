class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :price
      t.string :image
      t.string :description
      t.references :categori , index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :products, [:categori_id, :created_at]
  end
end
