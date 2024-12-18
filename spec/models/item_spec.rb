require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'すべての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '商品名が40文字以上では登録できない' do
        @item.item_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it 'カテゴリーが選択されていなければ出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '商品の状態が選択されていなければ出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '配送料の負担が選択されていなければ出品できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '発送元の地域が選択されていなければ出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '発送までの日数が選択されていなければ出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '価格が300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '価格が10,000,000以上では出品できない' do
        @item.price = 10_000_001
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it 'ユーザーが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end
    end
  end
end
