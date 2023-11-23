class CreatePriceEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :price_entries do |t|
      t.references :store, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string    :currency, default: "BGN", null: false
      t.integer   :price_cents, null: false
      t.integer   :promo_price_cents
      t.datetime  :promo_price_active_from
      t.datetime  :promo_price_active_to
      t.boolean   :archived, default: false, null: false

      t.timestamps
    end

    add_index :price_entries, [:store_id, :product_id], unique: true
  end
end
