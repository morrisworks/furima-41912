FactoryBot.define do
  factory :item do
    
    item_name {Faker::Name.name}
    item_info {Faker::Lorem.sentence}
    item_category_id{Faker::Number.within(range: 2..10) }
    item_sales_status_id{Faker::Number.within(range: 2..7) }
    item_shipping_fee_status_id{Faker::Number.within(range: 2..3) }
    prefecture_id{Faker::Number.within(range: 2..48) }
    item_scheduled_delivery_id{Faker::Number.within(range: 2..4) }
    item_price{Faker::Number.within(range: 300..9999999) }
    association :user

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
