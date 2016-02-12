class Payment < ActiveRecord::Base
  belongs_to :order

  enum payment_method: [ :cc, :ach, :btc ]

end
