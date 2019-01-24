require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "unit tests" do
    describe "class method: check_amount_with_plan " do
      it "will return a true value if plan_id aligns with plan payment amount" do

        object ={ :customer => { :first_name => "Jim", :last_name => "Jones", :address => "2120 Wimbledon Court", :city => "Modesto", :state => "CA", :zip => "95355"} , :amount => "4900", :card_number => "42424242424242420", "cvv"=>"123", :expiration_month =>"01", :expiration_year =>"2024", :zip_code=>"11754", :plan_id=>"2", :controller =>"api/v1/subscriptions", :action =>"create"}

        bool = Subscription.check_amount_with_plan(object)
        expect(bool).to eq(true)
      end

      it "will return a false value if plan_id does not aligns with plan payment amount" do
        object ={ :customer => { :first_name => "Jim", :last_name => "Jones", :address => "2120 Wimbledon Court", :city => "Modesto", :state => "CA", :zip => "95355"} , :amount => "4900", :card_number => "42424242424242420", "cvv"=>"123", :expiration_month =>"01", :expiration_year =>"2024", :zip_code=>"11754", :plan_id=>"1", :controller =>"api/v1/subscriptions", :action =>"create"}

        bool = Subscription.check_amount_with_plan(object)
        expect(bool).to eq(false)
      end

      it "will return a false value if plan_id doesnt exist" do
        object ={ :customer => { :first_name => "Jim", :last_name => "Jones", :address => "2120 Wimbledon Court", :city => "Modesto", :state => "CA", :zip => "95355"} , :amount => "4900", :card_number => "42424242424242420", "cvv"=>"123", :expiration_month =>"01", :expiration_year =>"2024", :zip_code=>"11754", :plan_id=>"5", :controller =>"api/v1/subscriptions", :action =>"create"}

        bool = Subscription.check_amount_with_plan(object)
        expect(bool).to eq(false)
      end
    end
  end
end
