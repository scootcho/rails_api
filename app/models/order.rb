class Order < ActiveRecord::Base
	has_many :order_items
  belongs_to :company

	validates :subtotal, :tax, :shipping, :total, presence: true

	before_create :set_order_status
	before_save :update_subtotal

  enum status: [ :cancelled, :in_progress, :completed, :invoiced ]

	def subtotal
		order_items.each { |item| item.valid? ? (item.quantity * item.unit_price) : 0 }.sum
	end
	
	private

	def set_order_status
		self.status = 1
	end

	def update_subtotal
		self[:subtotal] = subtotal
	end
end

