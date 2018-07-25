class Card < ApplicationRecord
  belongs_to :customer

  validates_uniqueness_of :card_number
  validates_presence_of :card_number,
                        :expiration_date,
                        :cvv,
                        :billing_zip_code
end
