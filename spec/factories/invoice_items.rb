FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Name .unique.name }
    unit_price { Faker::Number.between(from = 10.00, to = 999.00) }
    item
    invoice
  end
end
