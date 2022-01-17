class Order < ApplicationRecord
 has_many :oder_items, dependent: :destroy
 belongs_to :member

end
