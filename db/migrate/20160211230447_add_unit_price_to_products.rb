class AddUnitPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :unit_price, :decimal, precision: 10, scale: 2
  end
end
