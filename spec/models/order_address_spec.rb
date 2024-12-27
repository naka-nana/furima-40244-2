require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    Rails.logger.debug "Created user: #{@user.inspect}"
    @item = FactoryBot.create(:item, user: @user)
    Rails.logger.debug "Created item: #{@item.inspect}"

    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    Rails.logger.debug "Created order_address: #{@order_address.inspect}"
  end
  describe '商品購入' do
    context '商品購入できる時' do
      it 'すべての項目が正しく入力されている場合、購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
      end
    end
    context '商品購入できない時' do
      it 'postal_codeが空の場合、購入できない' do
        @order_address.postal_code = ''
        expect(@order_address).to_not be_valid
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフン含んだ正しい形式でない場合、購入できない' do
        @order_address.postal_code = '1234567'
        expect(@order_address).to_not be_valid
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していない場合、購入できない' do
        @order_address.prefecture_id = '1'
        expect(@order_address).to_not be_valid
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空の場合、購入できない' do
        @order_address.city = ''
        expect(@order_address).to_not be_valid
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空の場合、購入できない' do
        @order_address.house_number = ''
        expect(@order_address).to_not be_valid
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phoneが空の場合、購入できない' do
        @order_address.phone = ''
        expect(@order_address).to_not be_valid
      end
      it 'userが紐づいていない場合、購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていない場合、購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
