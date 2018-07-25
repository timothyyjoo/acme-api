class Card < ApplicationRecord
  validates_presence_of :card_number, uniqueness: true
  validates_presence_of :expiration_date,
                        :cvv,
                        :billing_zip_code
end
