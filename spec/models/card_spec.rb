require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "validations" do
    it "will save to the DB if all attributes are present" do
      customer = create(:customer)
      card = Card.new(card_number: 12345, expiration_date: "09/20", cvv: "877", billing_zip_code: 95355, customer_id: customer)
      expect(card).to be_valid
    end

    it "will not save to the db without card num" do
      customer = create(:customer)
      card = Card.new(expiration_date: "09/20", cvv: "877", billing_zip_code: 95355, customer_id: customer)
      expect(card).to_not be_valid
    end

    it "will not save to db without exp date" do
      customer = create(:customer)
      card = Card.new(card_number: 12345, cvv: "877", billing_zip_code: 95355, customer_id: customer)
      expect(card).to_not be_valid
    end

    it "will not save to db without cvv" do
      customer = create(:customer)
      card = Card.new(card_number: 1235, expiration_date: "09/20", billing_zip_code: 95355, customer_id: customer)
      expect(card).to_not be_valid
    end

    it "will not save to db without bill zip code" do
      customer = create(:customer)
      card = Card.new(card_number: 1235, expiration_date: "09/20", cvv: "123", customer_id: customer)
      expect(card).to_not be_valid
    end

    it "will not save to db if there is a card already existing in db by card number" do
      card = create(:card, card_number: 12345)
      customer = create(:customer)
      card_2 = Card.new(card_number: 12345, expiration_date: "09/20", cvv: "877", billing_zip_code: 95355, customer_id: customer)
      card_2.save
      expect(card_2).to_not be_valid
    end
  end
end
