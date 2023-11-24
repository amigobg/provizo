class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
       t.string  :title
       t.text    :description
       t.string  :brand
       t.integer :barcode
       t.integer :category_id

       t.timestamps
    end
  end
end
