class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item
  def index
    @order = @item.order
    @order_address = OrderAddress.new
  end

  def create
    Rails.logger.debug "Parameters: #{params.inspect}"
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path, notice: '購入が完了しました'
    else
      flash.now[:alert] = '入力内容を確認してください'
      Rails.logger.debug @order_address.errors.full_messages
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone).merge(
      user_id: current_user.id,
      item_id: @item.id
    )
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone)
  end
end
