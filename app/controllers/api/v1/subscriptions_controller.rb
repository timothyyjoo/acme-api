class Api::V1::SubscriptionsController < ApplicationController


  def create
    response = FakepayService.post_json('/purchase', params).body
    check_error(response)
  end

  def check_error(object)
    FakepayService.check_amount_with_plan(params)
    formatted = FakepayService.parse_json(object)
    if formatted[:success] == false
      render json: { :errors => "Your transaction failed due to error code: #{formatted[:error_code]}. Please check the error code description"}
      # puts "Your transaction failed due to error code: #{formatted[:error_code]}. Please check the error code description"
    elsif formatted[:success] == true
      render json: { :success => "Your transaction was successfully posted!"}
      render json: Customer.store_token(formatted, params, customer_params) 
    else
      render json: {:payload => formatted}
    end
  end




  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :city, :state, :zip)
  end


end
