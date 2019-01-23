class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :plan

  def self.validate_pricing
      { "1" =>  [1999, "1999"], "2" =>  ["4900", 4900], "3" =>  ["9900", 9900]}
  end

  def self.check_amount_with_plan(object)
    plan = object[:plan_id]
    amount = object[:amount]
    Subscription.validate_pricing[plan].include?(amount)
  end
end
