class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :histories
  validate :password_complexity

  # 全ての属性に共通するpresence: trueをまとめる
  with_options presence: true do
    validates :nickname, length: { maximum: 6 }
    validates :birth_date
    # 全角文字のバリデーションをまとめる
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :last_name
      validates :first_name
    end
    # カタカナのバリデーションをまとめる
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  # パスワードの複雑さをチェックするカスタムバリデーション
  validate :password
  def password_complexity
    # パスワードが空、または半角英数字混合であればOK
    return if password.blank? || password =~ /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  
    errors.add(:password, 'is invalid. Include both letters and numbers')
  end
end
