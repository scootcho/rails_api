class Product < ActiveRecord::Base
  belongs_to :company
  has_many :order_items

  default_scope { where("quantity > ?", 0) } #only show products in stock
end
