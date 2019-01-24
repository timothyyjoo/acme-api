class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :plan

  def self.set_plan_and_amount(object)
    plan = object[:plan_id]
    amount = object[:amount]

    self.valid_plan?(plan, amount)
  end

  def self.valid_plan?(plan_id, amount)
    begin
      plan = Plan.find(plan_id)
    rescue ActiveRecord::RecordNotFound
      return {:error => "Plan_id does not exist in database"}
    end
    self.check_amount_against_plan(plan, amount)
  end

  def self.check_amount_against_plan(plan, amount)
    find_by_amount = Plan.find_by(price: amount)
    if plan.id == find_by_amount.id
      true
    else
      false
    end
  end

end
