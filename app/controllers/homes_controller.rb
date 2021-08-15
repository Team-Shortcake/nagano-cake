class HomesController < ApplicationController
    def top
      @genres = Genre.where(valid_invalid_status: 0) # ジャンルの無効ステータスを除外する
      @items = Item.limit(8).offset(4) # 先頭から5つのレコードから８つを取得
    end
    def about
        
    end
end
