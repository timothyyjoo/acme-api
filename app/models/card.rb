class Card < ApplicationRecord
  validates_uniqueness_of :card_number
  validates_presence_of :card_number,
                        :expiration_date,
                        :cvv,
                        :billing_zip_code
end
