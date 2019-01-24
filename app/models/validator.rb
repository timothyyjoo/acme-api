class Validator

  def self.check_subscription(object, params, customer_params)
   if Subscription.check_amount_with_plan(params) == true
     self.check_transaction(object, params, customer_params)
   else
     return {:error =>  "The payment amount does not align with the price of the selected plan. Please check your POST request"}
   end
  end

  def self.check_transaction(object, params, customer_params)
    formatted = FakepayService.parse_json(object)
    if formatted[:success] == false
      return {:error =>  "Your transaction failed due to error code: #{formatted[:error_code]}. Please check the error code description"}
    elsif formatted[:success] == true
      customer_validation = Customer.store_token(formatted, params, customer_params)
      return customer_validation
    else
      return formatted
    end
  end
end
