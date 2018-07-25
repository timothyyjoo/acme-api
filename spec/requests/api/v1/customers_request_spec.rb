require 'rails_helper'

describe "Customer API" do
  it "sends a list of customers" do
    create_list(:customer, 5)

    get '/api/v1/customers'

    expect(response).to be_successful
    customers = JSON.parse(response.body)

    expect(customers.count).to eq(5)
  end

  it "sends a single customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"
    expect(response).to be_successful
    
    customers = JSON.parse(response.body)

    expect(customer["id"]).to eq(id)
  end
end
