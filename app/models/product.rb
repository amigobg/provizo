class Product < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :price_entries, dependent: :destroy
  has_many :stores, through: :price_entries
  
  has_one_attached :image
  
  accepts_nested_attributes_for :price_entries
  
  validates :barcode, :title, presence: true
end
