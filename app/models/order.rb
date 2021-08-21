class Order < ApplicationRecord
  
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  

  
  # 注文ステータス（0=支払待ち / 1=支払済み / 2=発送準備中 / 3=発送済み）
  enum order_status: { 支払待ち:0, 支払済み:1, 発送準備中:2, 発送済み:3}
  # 支払い方法（0=クレジットカード/ 1= 銀行振込）
  enum payment: { クレジットカード:0, 銀行振込:1}
end
