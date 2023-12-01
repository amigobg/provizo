class Product < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :price_entries, dependent: :destroy
  has_many :stores, through: :price_entries
  
  has_one_attached :image, dependent: :destroy
  
  accepts_nested_attributes_for :price_entries, allow_destroy: true
  
  validates :title, presence: true
  validates_uniqueness_of :barcode, on: :create
  
  broadcasts_refreshes
end
