class Order < ApplicationRecord
  # 注文ステータス（0=支払待ち / 1=支払済み / 2=発送準備中 / 3=発送済み）
 enum order_status: {
      waiting: 0,
      paid_up: 1,
      in_production: 2,
      preparing: 3,
      shipped: 4
  }
end
