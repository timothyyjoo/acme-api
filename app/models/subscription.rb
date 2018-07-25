class Subscription < ApplicationRecord
  belongs_to :customer

  validates_presence_of :name, :price
end
