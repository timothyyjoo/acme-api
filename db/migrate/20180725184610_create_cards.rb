class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :card_number
      t.string :expiration_date
      t.string :cvv
      t.integer :billing_zip_code

      t.timestamps
    end
  end
end
