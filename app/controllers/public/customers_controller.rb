class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render "edit"
    end
  end
  private


  def customer_params
  	params.require(:customer).permit(:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
