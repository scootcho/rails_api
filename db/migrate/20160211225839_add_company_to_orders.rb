class AddCompanyToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :company, index: true
    add_foreign_key :orders, :companies
  end
end
