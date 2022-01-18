class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :oder_items, dependent: :destroy
  belongs_to :genre

  attachment :image

  enum sales_status: { 販売中: 0, 販売中止: 1 }
end
