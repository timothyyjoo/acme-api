require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "unit tests" do
    describe "class method: set_plan_and_amount " do
      before :each do
        Plan.create(name: "Bronze Box", price: "1999")
        Plan.create(name: "Silver Box", price: "4900")
        Plan.create(name: "Gold Box", price: "9900")
      end

      it "will return a true value if plan_id aligns with plan payment amount" do
        object ={ :customer => { :first_name => "Jim", :last_name => "Jones", :address => "2120 Wimbledon Court", :city => "Modesto", :state => "CA", :zip => "95355"} , :amount => "4900", :card_number => "42424242424242420", "cvv"=>"123", :expiration_month =>"01", :expiration_year =>"2024", :zip_code=>"11754", :plan_id=>"2", :controller =>"api/v1/subscriptions", :action =>"create"}

        bool = Subscription.set_plan_and_amount(object)
        expect(bool).to eq(true)
        # bool = Subscription.check_amount_with_plan(object)
        # expect(bool).to eq(true)
      end

      it "will return a false value if plan_id does not aligns with plan payment amount" do
        object ={ :customer => { :first_name => "Jim", :last_name => "Jones", :address => "2120 Wimbledon Court", :city => "Modesto", :state => "CA", :zip => "95355"} , :amount => "4900", :card_number => "42424242424242420", "cvv"=>"123", :expiration_month =>"01", :expiration_year =>"2024", :zip_code=>"11754", :plan_id=>"1", :controller =>"api/v1/subscriptions", :action =>"create"}

        bool = Subscription.set_plan_and_amount(object)
        expect(bool).to eq(false)
      end

      it "will return a false value if plan_id doesnt exist" do
        object ={ :customer => { :first_name => "Jim", :last_name => "Jones", :address => "2120 Wimbledon Court", :city => "Modesto", :state => "CA", :zip => "95355"} , :amount => "4900", :card_number => "42424242424242420", "cvv"=>"123", :expiration_month =>"01", :expiration_year =>"2024", :zip_code=>"11754", :plan_id=>"5", :controller =>"api/v1/subscriptions", :action =>"create"}
        json = Subscription.set_plan_and_amount(object)
        
        expect(json).to eq({:error => "Plan_id does not exist in database"})
      end
    end
  end
end
