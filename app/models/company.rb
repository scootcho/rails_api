class Company < ActiveRecord::Base
  has_many :products
  has_many :licenses
end
