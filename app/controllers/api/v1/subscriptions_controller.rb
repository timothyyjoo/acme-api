class Api::V1::SubscriptionsController < ApplicationController

  def show

  end

  def create
    response = FakepayService.post_json('/purchase', params).body

    check_error(response)
  end

  def check_error(object)
    formatted = FakepayService.parse_json(object)
    if ErrorCheck.check_amount(params) == false
       puts "Your transaction failed due to incorrect amount"
       return
    end
    if formatted[:success] == false
      puts "Your transaction failed due to error code: #{formatted[:error_code]}. Please check the error code description"
    elsif formatted[:success] == true
      puts "Your transaction was successfully posted!"
      store_token(formatted)
    else
      puts formatted
    end
  end


  def store_token(parsed_response)
    @customer = Customer.new(customer_params)
    if @customer.save!
      plan = Subscription.find(params[:subscription_id])
      @customer.subscriptions << plan
      @customer.token = parsed_response[:token]
      puts "You've successfully loaded a customer into the database"
    else
      puts "There was an issue with customer details and we were unable to save the information in our database"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :city, :state, :zip)
  end


end
