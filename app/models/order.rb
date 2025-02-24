class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  validates :user_id, presence: true
  validates :item_id, presence: true
  attr_accessor :token
end
