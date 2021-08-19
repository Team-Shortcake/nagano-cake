class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :cart_item_item?, only: [:create]

  def index
    @cart_items = current_customer.cart_item
    # totalに代入するものは整数値と宣言
    @total = 0
  end

  def create
    #カート内商品の有無
    if current_customer.cart_item.count >= 1
      #カート内商品追加の
      if nil != current_customer.cart_item.find_by(item_id: params[:cart_item][:item_id])
        #カート内の既存商品の情報取得
        @cart_item_u = current_customer.cart_item.find_by(item_id: params[:cart_item][:item_id])
        #既にある情報に個数を合算
        @cart_item_u.quantity += params[:cart_item][:quantity].to_i
        #情報の更新　個数カラムのみ
        @cart_item_u.update(quantity: @cart_item_u.quantity)
        #カートページ遷移
        redirect_to cart_items_path
      else
        #新しくカートの作成
        @cart_item = CartItem.new(cart_item_params)
        #誰のカートか紐付け
        @cart_item.current_customer_id = current_customer.id
        #情報を保存できるか？
        if cart_item.save
          #カートページ遷移
          redirect_to cart_items_path
        else
          #販売ステータスが「0」のものを見つける
          @items = Item.where(order_status: 0).page(params[:page]).per(8)
          #商品の数をカウント
          @quantity = Item.count
          #有効、無効ステータスが0のものを見つける
          @genres = Genre.where(valid_invalid_status: 0)
          #indexアクションを呼び出す
          render 'index'
        end
      end
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
        redirect_to cart_items_path
      else
        @items = Item.where(order_status: 0).page(params[:page]).per(8)
        @quantity = Item.count
        @genres = Genre.where(valid_invalid_status: 0)
        render 'index'
      end
    end
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
    @cart_item = current_customer.cart_item
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_item?
    redirect_to item_path(params[:cart_item][:item_id]), notice: "個数を入力してください。" if params[:cart_item][:quantity].empty?
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :current_customer_id)
  end

end
