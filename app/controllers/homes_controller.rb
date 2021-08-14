class HomesController < ApplicationController
    def top
        @genres = Genre.where(vailid_invalid_status: 0) # ジャンルの無効ステータスのものを除外検索
        @items = Item.limit(8).offset(4) #　つのレコードから4つ取り出す
    end
    def about
    end
end
