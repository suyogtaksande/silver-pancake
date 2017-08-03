class CreateStripePayments < ActiveRecord::Migration
  def change
    create_table :stripe_payments do |t|
      t.integer :amount
      t.string :user_id
      t.string :currency
      t.string :customer
      t.string :card_token
      t.timestamps null: false
    end
  end
end
