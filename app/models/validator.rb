class Validator

  def self.check_subscription(object, params, customer_params)
   return Subscription.set_plan_and_amount(params) if Subscription.set_plan_and_amount(params).class == Hash

   if Subscription.set_plan_and_amount(params) == true
     self.check_transaction(object, params, customer_params)
   else
     return {:error =>  "The payment amount does not align with the price of the selected plan. Please check your POST request"}
   end
  end

  def self.check_transaction(object, params, customer_params)
    response = FakepayService.parse_json(object)
    response_unsuccessful?(response, params, customer_params)
  end

  ##Noticed that I do my customer validation after i validate my transaction. This order needs to be reversed. Customer should be saved to database, then transaction is validated, and then authorization token should be saved to that customer. 
  def self.response_unsuccessful?(response, params, customer_params)
    return {:error =>  "Your transaction failed due to error code: #{response[:error_code]}. Please check the error code description"} if response[:success] == false

    customer_validation = Customer.store_token(response, params, customer_params)
    return customer_validation
  end
end
