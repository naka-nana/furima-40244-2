class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :histories
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  
    errors.add(:password, 'is invalid')
  end
  validates :nickname, length: { maximum: 6 }, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :birth_date, presence: true
end
