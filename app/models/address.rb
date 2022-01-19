class Address < ApplicationRecord
  belongs_to :member,optional: true

  validates :post_number, presence: true
  validates :address, presence: true
  validates :name, presence: true

end
