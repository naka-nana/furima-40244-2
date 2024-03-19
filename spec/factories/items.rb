FactoryBot.define do
  factory :item do
    name { "テスト商品名" }
    text { "テスト商品の説明" }
    category_id { 2 } # 「メンズ」を仮定
    situation_id { 2 } # 「新品・未使用」を仮定
    shippingfee_id { 2 } # 「送料込み(出品者負担)」を仮定
    region_id { 2 } # 「北海道」を仮定
    shippingday_id { 2 } # 「1~2日で発送」を仮定
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: StringIO.new('これはテスト画像の内容です'),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end