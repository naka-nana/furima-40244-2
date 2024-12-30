FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    house_number { '1-2-3' }
    building { 'アーバンビル' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }

    association :user
    association :item
  end
end