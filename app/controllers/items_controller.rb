class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が正常に出品されました。'
    else
      # 保存に失敗した場合、`new`テンプレートを再表示
       render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text, :price, :category_id, :condition_id, :region_id, :shippingday_id, :shippingfee_id, :situation_id,)
  end
end
