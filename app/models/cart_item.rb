class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :member

  validates :count, presence: true
end
