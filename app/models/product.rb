class Product < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :price_entries, dependent: :destroy
  has_many :stores, through: :price_entries
  
  validates :title, presence: true
end
