class Company < ActiveRecord::Base
  has_many :users
  has_many :licenses
  has_many :orders
  has_many :products

  has_many :order_items, through: :products   #TODO make it :sold_prodcuts instead of order_items for better readability
end
