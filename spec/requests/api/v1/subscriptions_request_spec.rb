require 'rails_helper'

describe "subscriptions api" do
  # it "accepts a valid POST request" do
  #   create_list(:plan, 3)
  #   subscription_params = {
  #   	"customer": {
  #   		"first_name": "Jim",
  #   		"last_name": "Jones",
  #   		"address": "2120 Wimbeldon Court",
  #   		"city": "Modesto",
  #   		"state": "CA",
  #   		"zip": 95355
  #   	},
  #   	"amount": "4900",
  #   	"card_number": "42424242424242420",
  #   	"cvv": "123",
  #   	"expiration_month": "01",
  #   	"expiration_year": "2024",
  #   	"zip_code": "11754",
  #   	"plan_id": 2
  #
  #   }
  #
  #   post "/api/v1/subscriptions", {params:  subscription_params }
  #
  #   customer = Customer.last
  #
  #   assert_response :success
  #   expect(response).to be_success
  #
  #   expect(customer.first_name).to eq(subscription_params[:customer][:first_name])
  #   expect(customer.plans.first.id).to eq(subscription_params[:plan_id])
  #   expect(response.body).to eq('{"status":"You have successfully loaded a customer into the database"}')
  # end
  #
  # it "invalid post request returns json_message" do
  #   create_list(:plan, 3)
  #   subscription_params = {
  #   	"customer": {
  #   		"first_name": "Jim",
  #   		"last_name": "Jones",
  #   		"address": "2120 Wimbeldon Court",
  #   		"city": "Modesto",
  #   		"state": "CA",
  #
  #   	},
  #   	"amount": "4900",
  #   	"card_number": "42424242424242421",
  #   	"cvv": "123",
  #   	"expiration_month": "01",
  #   	"expiration_year": "2024",
  #   	"zip_code": "11754",
  #   	"plan_id": 2
  #
  #   }
  #
  #   post "/api/v1/subscriptions", {params:  subscription_params }
  #
  #   expect(response.body).to eq('{"error":"Your transaction was successful but there was an issue with customer details and we were unable to save the information in our database"}')
  # end
  #
  # it "invalid plan_id and amount POST request returns json_message" do
  #   create_list(:plan, 3)
  #   subscription_params = {
  #   	"customer": {
  #   		"first_name": "Jim",
  #   		"last_name": "Jones",
  #   		"address": "2120 Wimbeldon Court",
  #   		"city": "Modesto",
  #   		"state": "CA",
  #
  #   	},
  #   	"amount": 1999,
  #   	"card_number": "42424242424242421",
  #   	"cvv": "123",
  #   	"expiration_month": "01",
  #   	"expiration_year": "2024",
  #   	"zip_code": "11754",
  #   	"plan_id": 3
  #
  #   }
  #
  #   post "/api/v1/subscriptions", {params:  subscription_params }
  #
  #   expect(response.body).to eq('{"error":"The payment amount does not align with the price of the selected plan. Please check your POST request"}')
  # end

end
