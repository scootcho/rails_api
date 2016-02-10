class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self['unit_price']
    else
      product.price
    end
  end

  def total_price
    quantity * unit_price
  end

private
  def product_present
    if product.nil?
      error.add(:product, "is not valid or is not available")
    end
  end
  
  def order_present
    if order.nil?
      error.add(:order, "is not a valid order")
    end
  end

  def finalize
    self['unit_price'] = unit_price
    self['total_price'] = total_price
  end
end
