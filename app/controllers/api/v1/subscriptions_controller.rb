class Api::V1::SubscriptionsController < ApplicationController


  def create
    response = FakepayService.post_json('/purchase', params).body
    check_subscription(response)
  end

  def check_subscription(object)
   if Subscription.check_amount_with_plan(params) == true
     check_transaction(object)
   else
   render json: {:error =>  "The payment amount does not align with the price of the selected plan. Please check your POST request"}
   end
  end

  def check_transaction(object)
    formatted = FakepayService.parse_json(object)
    if formatted[:success] == false
      render json: {:error =>  "Your transaction failed due to error code: #{formatted[:error_code]}. Please check the error code description"}
    elsif formatted[:success] == true
      customer_validation = Customer.store_token(formatted, params, customer_params)
      render json: customer_validation
    else
      render json: formatted
    end
  end



  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :city, :state, :zip)
  end


end
