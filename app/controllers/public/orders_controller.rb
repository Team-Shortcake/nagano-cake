class Public::OrdersController < ApplicationController
  # ログイン状態でのみ
  before_action :authenticate_member!
  before_action :request_post?, only: [:confirm]
  before_action :order_new?, only: [:new]
  
  def index
    @orders = current_customer.orders
  end

  def show
  end

  def new
  end

  def create
  end
end
