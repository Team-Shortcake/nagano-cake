class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(sale_status: 0).page(params[:page]).per(8) 
    @quantity = Item.count 
    @genres = Genre.where(valid_invalid_status: 0) 
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.where(valid_invalid_status: 0)
  end
end
