class Public::AddressesController < ApplicationController
  # before_action :authenticate_customer!


  def index
    # @delivery_address = DeliveryAddress.find(params[:id])
    # @addresses = current_member.addresses
    @deliveryes = DeliveryAddress.all
    @delivery_address = DeliveryAddress.new
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.user_id = current_customer.id
    if @delivery_address.save!
      # redirect_back(fallback_location: root_path)
      redirect_to addresse_path
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

# app/controllers/public/addresses_controller.rb:15:in `<class:AddressesController>'
# app/controllers/public/addresses_controller.rb:1:in `<main>'