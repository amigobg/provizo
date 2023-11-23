class PriceEntry < ApplicationRecord
  belongs_to :product
  belongs_to :store
  
  monetize :price_cents, with_model_currency: :currency, numericality: { greater_than_or_equal_to: 0 }
  monetize :promo_price_cents, with_model_currency: :currency, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  validates :currency, presence: true
  validate :price_greater_than_promo_price
  validate :valid_promo_date_range
  
  
  private
    def price_greater_than_promo_price
      return if promo_price.blank? || price.blank?

      if price <= promo_price
        errors.add(:price, 'must be greater than promo price')
      end
    end
    
    def valid_promo_date_range
      return if promo_price_active_from.blank? || promo_price_active_to.blank?

      if promo_price_active_from >= promo_price_active_to
        errors.add(:promo_price_active_from, 'must be before the end date')
      end
    end
end
