class AddCustomerToCard < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :customer, foreign_key: true
  end
end
