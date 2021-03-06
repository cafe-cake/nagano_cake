class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  validates :is_deleted, inclusion: { in: [true, false] }
  validates :last_name,:first_name, presence: true,
    length: {in: 1..20 }
  validates :last_name_kana,:first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ , message: "全角カタカナで入力してください。"},
    length: {in: 1..20 }
  validates :address, presence: true
  validates :post_number, format: {with: /\A\d{7}\z/ , message: "ハイフンなしの７文字で入力してください。"}
  validates :phone_number, format: {with: /\A\d{10,11}\z/ , message: "ハイフンなし10～11文字で入力してください。"}

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
