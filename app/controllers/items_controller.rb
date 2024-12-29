class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :check_owner, only: [:edit, :update]
  before_action :check_item_status, only: [:edit, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @item.user_id = current_user.id
  end

  def update
    @item.user_id = current_user.id
    if @item.update(item_params)
      redirect_to root_path
    else
      flash.now[:alert]
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_item_status
    return unless @item.sold_out?

    redirect_to root_path, alert: 'この商品は既に購入済みのため、編集や削除はできません。'
  end

  def check_owner
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :condition_id, :prefecture_id, :shipping_id,
                                 :shipping_day_id, :price)
  end
end
