require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'nicknameが40文字以上では登録できない' do
      @user.nickname = 'a' * 41
      @user.valid?
      expect(@user.errors.full_messages).to include 'Nickname is too long (maximum is 40 characters)'
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは@がないと登録できない' do
      @user.email = 'testexample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'a' * 5
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)" # rubocop:disable Style/StringLiterals
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = 'a' * 130
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)" # rubocop:disable Style/StringLiterals
    end
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid" # rubocop:disable Style/StringLiterals
    end
    it 'passwordは数字だけでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid" # rubocop:disable Style/StringLiterals
    end
    it 'passwordは英字だけでは登録できない' do
      @user.password = 'abcdfg'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'お名前(last_name)がないと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'お名前(first_name)がないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前(last_name)は全角(漢字・ひらがな・カナ)でないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid" # rubocop:disable Style/StringLiterals
    end
    it 'お名前(first_name)は全角(漢字・ひらがな・カナ)でないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid" # rubocop:disable Style/StringLiterals
    end
    it 'お名前カナ(last_name_kana)がないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'お名前カナ(first_name_kana)がないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'お名前カナ(last_name_kana)が全角カナでないと登録できない' do
      @user.last_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'お名前カナ(first_name_kana)が
    全角カナでないと登録できない' do
      @user.first_name_kana = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '生年月日がないと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
