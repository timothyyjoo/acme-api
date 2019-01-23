class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :plan

  def self.validate_pricing
      { 1 =>  [1999, "1999"], 2 =>  ["4900", 4900], 3 =>  ["9900", 9900]}
  end
end
