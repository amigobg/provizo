class Product < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :price_entries, dependent: :destroy
  has_many :stores, through: :price_entries
  
  has_one_attached :image, dependent: :destroy
  
  validates :title, presence: true
  validates :barcode, uniqueness: { scope: :store_id }
  
  broadcasts_refreshes
end
