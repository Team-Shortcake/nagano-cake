class HomesController < ApplicationController
    def top
      @genres = Genre.where(valid_invalid_status: 0) # ジャンルの無効ステータスの除外検索
      @items = Item.limit(8).offset(5)
    end
    def about
        
    end
end
