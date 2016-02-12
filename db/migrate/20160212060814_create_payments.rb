class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :order, index: true
      t.string :transaction_id,
      t.integer :payment_method

      t.timestamps null: false
    end
    add_foreign_key :payments, :orders
  end
end
