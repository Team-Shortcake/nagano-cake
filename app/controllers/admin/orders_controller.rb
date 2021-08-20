class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders=Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
   
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
