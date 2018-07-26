class Customer < ApplicationRecord
  has_many :subscriptions, :dependent => :delete_all
  has_many :plans, :through => :subscriptions


  validates_presence_of :first_name,
                        :last_name,
                        :address,
                        :city,
                        :state,
                        :zip



  def self.store_token(object, params, customer_data)

    @customer = Customer.new(customer_data)
    if @customer.save!
      plan = Plan.find(params[:plan_id])
      @customer.plans << plan
      @customer.token = object[:token]
      @customer.save
      puts "You've successfully loaded a customer into the database"
    else
      puts "There was an issue with customer details and we were unable to save the information in our database"
    end
  end
end
