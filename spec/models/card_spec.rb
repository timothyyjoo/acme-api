require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "validations" do
    it "will save to the DB if all attributes are present" do
      card = Card.new(card_number: 12345, expiration_date: "09/20", cvv: "877", billing_zip_code: 95355)
      expect(card).to be_valid
    end

    it "will not save to the db without card num" do
      card = Card.new(expiration_date: "09/20", cvv: "877", billing_zip_code: 95355)
      expect(card).to_not be_valid
    end

    it "will not save to db without exp date" do
      card = Card.new(card_number: 12345, cvv: "877", billing_zip_code: 95355)
      expect(card).to_not be_valid
    end

    it "will not save to db without cvv" do
      card = Card.new(card_number: 1235, expiration_date: "09/20", billing_zip_code: 95355)
    end

    it "will not save to db without bill zip code" do
      card = Card.new(card_number: 1235, expiration_date: "09/20", cvv: "123")
    end

    it "will not save to db if there is a card already existing in db by card number" do
      card = create(:card, card_number: 12345)
      
      card_2 = Card.new(card_number: 12345, expiration_date: "09/20", cvv: "877", billing_zip_code: 95355)
      card_2.save
      expect(card_2).to_not be_valid
    end
  end
end
