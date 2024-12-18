FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.characters(number: 40) }
    item_info { Faker::Lorem.characters(number: 1000) }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 6) }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    shipping_id { Faker::Number.between(from: 2, to: 3) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_998) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
