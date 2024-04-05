class PriceEntry < ApplicationRecord
  belongs_to :product, touch: true
  belongs_to :store
  
  monetize :price_cents, with_model_currency: :currency, numericality: { greater_than_or_equal_to: 0 }
  monetize :promo_price_cents, with_model_currency: :currency, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  validates :currency, presence: true
  validate :price_greater_than_promo_price
  validate :valid_promo_date_range
  
  broadcasts_refreshes
  
  scope :cheapest, -> { 
    where("promo_price_cents IS NULL OR promo_price_cents >= price_cents")
    .order(price_cents: :asc) 
  }

  scope :recent, -> { order(created_at: :desc) }

  private
    def price_greater_than_promo_price
      return if promo_price.blank? || price.blank? || price > promo_price

      errors.add(:price, 'must be greater than promo price')
    end
    
    def valid_promo_date_range
      return if promo_price_active_from.blank? || promo_price_active_to.blank?
      return if promo_price_active_from < promo_price_active_to

      errors.add(:promo_price_active_from, 'must be before the end date')
    end
end
