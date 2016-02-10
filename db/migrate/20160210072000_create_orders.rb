class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :tax, precision: 10, scale: 2
      t.decimal :shipping, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2
      t.integer :status

      t.timestamps null: false
    end
  end
end
