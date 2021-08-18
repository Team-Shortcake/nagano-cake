class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :cart_item_item?, only: [:create]
  
  def index
    @cart_items = current_customer.cart_items
    # totalに代入するものは整数値と宣言
    @total = 0
  end

  def create
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_item?
    redirect_to item_path(params[:cart_item][:item_id]), notice: "個数を入力してください。" if params[:cart_item][:number_of_items].empty?
  end
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, number_of_items, :customer_id)
  end
  
end
