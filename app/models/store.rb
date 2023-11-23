class Store < ApplicationRecord
  has_many :price_entries, dependent: :destroy
  has_many :products, through: :price_entries
  
  validates :name, presence: true
end
