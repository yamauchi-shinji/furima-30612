FactoryBot.define do
  factory :purchase_order do
    price { Random.rand(300 .. 9999999) }
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '123-4567' }
    prefecture_id { Random.rand(1 .. 47) }
    city { Gimei.address.city.kanji }
    house_number { Gimei.town.kanji }
    building_name { '東京ハイツ' }
    phone { Faker::PhoneNumber.subscriber_number(length: 11) }
  end
end