require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe "database validations" do
    it "will save a customer in db only if all the attributes are saved" do
      customer = Customer.new(first_name: "Jim", last_name: "Jones", address: "2120 Wimbledon Court", city: "Modesto", state: "CA", zip: "95355", token: '12345')

      expect(customer).to be_valid
    end

    it "will not save a customer without first_name" do
      customer = Customer.new(last_name: "Jones", address: "2120 Wimbledon Court", city: "Modesto", state: "CA", zip: "95355",token: '12345')

      expect(customer).to_not be_valid
    end

    it "will not save a customer without last_name" do
      customer = Customer.new(first_name: "Jones", address: "2120 Wimbledon Court", city: "Modesto", state: "CA", zip: "95355", token: '12345')

      expect(customer).to_not be_valid
    end

    it "will not save a customer without address" do
      customer = Customer.new(first_name: "Jones", last_name: "Jones", city: "Modesto", state: "CA", zip: "95355", token: '12345')

      expect(customer).to_not be_valid
    end

    it "will not save a customer without city" do
      customer = Customer.new(first_name: "Jones", last_name: "Jones", address: "123 Modesto Lane", state: "CA", zip: "95355", token: '12345')

      expect(customer).to_not be_valid
    end

    it "will not save a customer without state" do
      customer = Customer.new(first_name: "Jones", last_name: "Jones", address: "123 Modesto Lane", city: "Culver City", zip: "95355", token: '12345')

      expect(customer).to_not be_valid
    end

    it "will not save a customer without zip" do
      customer = Customer.new(first_name: "Jones", last_name: "Jones", address: "123 Modesto Lane", city: "Culver City", state: "CA", token: '12345')

      expect(customer).to_not be_valid
    end
  end
end
