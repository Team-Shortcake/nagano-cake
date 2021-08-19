class Admin::OrdersController < ApplicationController
  def index
    @orders=Order.all
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
   
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end
  
  private
  def order_params
    params.require(:order).permit(:total_price,:payment,:order_status,:shipment_charge,:delivery_name,:postal_code,:deliveryaddress)
  end
  
end
