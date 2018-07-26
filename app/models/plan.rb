class Plan < ApplicationRecord
  has_many :subscriptions
  has_many :customers, :through => :subscriptions

  validates_presence_of :name, :price
end
