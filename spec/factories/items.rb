FactoryBot.define do
  factory :item do
    name { Faker::Name .unique.name }
    description { Faker::TvShows::SiliconValley.motto }
    unit_price { Faker::Number.between(from = 10.00, to = 999.00) }
    merchant
  end
end
