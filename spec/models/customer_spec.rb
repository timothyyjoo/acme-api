require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe "database validations" do
    it "will save a customer in db only if all the attributes are saved" do
      customer = Customer.new(first_name: "Jim", last_name: "Jones", address: "2120 Wimbledon Court")
    end
  end
end
