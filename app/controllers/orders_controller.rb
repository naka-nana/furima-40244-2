class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order = @item.order
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index'
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def order_address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone, :token).merge(
      user_id: current_user.id,
      item_id: @item.id
    )
  end

  def address_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: '指定された商品が見つかりませんでした。'
  end
end
