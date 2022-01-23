class Order < ApplicationRecord
 has_many :item_orders, dependent: :destroy
 belongs_to :member

 enum payment_method: { credit_card: 0, transfer: 1 }
 enum order_status: { payment_waiting: 0,payment_confirmation: 1,in_production: 2,preparing_delivery: 3,delivered: 4 }

 def sum_of_subtotal
  item_orders.price * item_orders.count
 end

 def sum_of_product
  sum_of_subtotal + postage
 end
end
