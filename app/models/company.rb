class Company < ActiveRecord::Base
  has_many :products, :licenses
end
