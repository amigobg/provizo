json.extract! product, :id, :title, :category_id, :brand, :barcode, :integer, :created_at, :updated_at
json.url product_url(product, format: :json)
