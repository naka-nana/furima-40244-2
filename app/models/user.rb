class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid' }, if: lambda {
    first_name.present?
  }
  validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid' }, if: lambda {
    last_name.present?
  }
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid' }, if: lambda {
    first_name_kana.present?
  }
  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid' }, if: lambda {
    last_name_kana.present?
  }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'is invalid' }, if: lambda {
    email.present?
  }
  validates :password, presence: true

  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'is invalid' }, if: lambda {
    password.present?
  }
  validates :password, length: { minimum: 6, maximum: 129 }, if: -> { password.present? }
  validates :birthday, presence: true
end
