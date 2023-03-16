FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content_string { Faker::Lorem.paragraph }
    published {
      r = rand(0..1)
      r == 0 ? false : true
    }
    user { nil }
  end
end
