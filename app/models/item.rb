class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  validates :item_name, :item_info, :price, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
