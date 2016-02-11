class Company < ActiveRecord::Base
  has_many :users
  has_many :products
  has_many :licenses
  has_many :orders
end
