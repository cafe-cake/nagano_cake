class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre

  attachment :image

  enum sales_status: { 販売中: 0, 販売中止: 1 }

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end