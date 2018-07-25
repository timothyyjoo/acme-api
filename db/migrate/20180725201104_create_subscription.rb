class CreateSubscription < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :price
    end
  end
end
