class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone, :token, :user_id, :item_id

  with_options presence: true do
    # validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :house_number
    validates :token
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :user_id, :item_id, numericality: { only_integer: true }
  end
  validate :postal_code_custom_error

  private

  def postal_code_custom_error
    return if postal_code.present? && postal_code =~ /\A\d{3}-\d{4}\z/

    errors.add(:postal_code, 'を正しい形式で入力してください（例: 123-4567）')
  end

  # validates :building

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create!(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                    building: building, phone: phone)
  end
end
