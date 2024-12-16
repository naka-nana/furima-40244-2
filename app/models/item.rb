class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, :item_info, :price, presence: true
end
