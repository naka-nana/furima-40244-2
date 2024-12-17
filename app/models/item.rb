class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_info, presence: true, length: { maximum: 1000 }
  validates :category_id, :condition_id, :prefecture_id, :shipping_id, :shipping_day_id, presence: true,
                                                                                         numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 99_999 }
end