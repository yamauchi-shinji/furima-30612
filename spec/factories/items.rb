FactoryBot.define do
  factory :item do
    product {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {Random.rand(1 .. 10)}
    status_id {Random.rand(1 .. 6)}
    shipping_charge_id {Random.rand(1 .. 2)}
    prefecture_id {Random.rand(1 .. 47)}
    day_id {Random.rand(1 .. 3)}
    price {Random.rand(300 .. 9999999)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
