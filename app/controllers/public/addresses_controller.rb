class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @delivery = current_customer.delivery_address
    @delivery_address = DeliveryAddress.new
  end

  def edit
    @delivery_address = DeliveryAddress.field(params[:])
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.customer_id = current_customer.id
    @delivery_address = current_customer.shipping_address
    if @delivery_address.save
      redirect_back(fallback_location: root_path)
    end
    
  end

  def update
  end

  def destroy
  end
  
  private
  
  def delivery_address_params
  	params.require(:delivery_address).permit(:postal_code, :address, :name)
  end
  
  
end
