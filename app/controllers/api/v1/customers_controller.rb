class Api::V1::CustomersController < ApplicationController

  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params["id"])
  end

  def create
    response = FakepayService.post_json('/purchase', params).body
    render json: Validator.check_subscription(response, params, customer_params)
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :city, :state, :zip)
  end
end
