require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user) # ItemがUserと関連付けられている場合
    @item = FactoryBot.build(:item, user: @user) # 全てのテストで使われる@itemの初期化
  end
  
  context '全ての項目が適切に入力されている場合' do
    it '商品を出品できる' do
      @item.price = 500
      expect(@item).to be_valid
    end
  end

  describe '商品出品機能のバリデーション' do
    it '商品画像が空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
  end

  context '商品説明' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '商品説明が空では出品できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
  end

  describe 'ActiveHash関連フィールドのバリデーション' do
    it 'カテゴリーに「----」が選択されている場合は出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態に「----」が選択されている場合は出品できない' do
      @item.situation_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Situation must be other than 1')
    end

    it '配送料の負担に「----」が選択されている場合は出品できない' do
      @item.shippingfee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shippingfee must be other than 1')
    end

    it '発送元の地域に「----」が選択されている場合は出品できない' do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Region must be other than 1')
    end

    it '発送までの日数に「----」が選択されている場合は出品できない' do
      @item.shippingday_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shippingday must be other than 1')
    end
  end

    
  
    it '価格が空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    before do
      @item.price = 'abc'
      @item.valid?
    end
    
    it '価格に半角数字以外が含まれている場合は出品できない' do
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '価格が300円未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が9_999_999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end

  context '出品者情報' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end