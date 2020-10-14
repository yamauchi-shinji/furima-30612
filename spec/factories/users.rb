FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    first_name { Gimei.first.kanji }
    family_name { Gimei.last.kanji }
    first_name_reading { Gimei.first.katakana }
    family_name_reading { Gimei.last.katakana }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    birthday { Faker::Date.backward }
  end
end