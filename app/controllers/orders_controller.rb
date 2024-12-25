class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item
  def index
    @order = @item.order
    @order_address = OrderAddress.new
    Rails.logger.debug "OrderAddress initialized: #{@order_address.inspect}"
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      flash.now[:alert] = '入力内容を確認してください'
      render :index, status: :unprocessable_entity
    end
    Address.create(address_params)
    redirect_to root_path
  end

  def new
    @order_address = OderAddress.new
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone).merge(
      user_id: current_user.id,
      item_id: @item_id
    )
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone)
  end
end
