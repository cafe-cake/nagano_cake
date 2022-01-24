class Order < ApplicationRecord
 has_many :item_orders, dependent: :destroy
 belongs_to :member

 enum payment_methods: { credit_card: 0, transfer: 1 }


end
