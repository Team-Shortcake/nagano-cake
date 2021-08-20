class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery_address, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders

  validates :address, presence: true
  validates :postal_code, presence: true
  validates :telephone_number, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true


    # 注文ステータス（0=支払待ち / 1=支払済み / 2=製作中/ 3=発送準備中 / 4=発送済み）
  enum order_status: {
      waiting: 0,
      paid_up: 1,
      in_production: 2,
      preparing: 3,
      shipped: 4
  }
  
  def active_for_authentication?
    super && (self.is_user_status == false)
  end
end
