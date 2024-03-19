class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :history

  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :region
  belongs_to_active_hash :shippingday
  belongs_to_active_hash :shippingfee
  belongs_to_active_hash :situation

  validates :name, :text, :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :situation_id, :region_id, :shippingday_id, :shippingfee_id, :situation_id, numericality: { other_than: 1, message: "must be other than 1" }
end
