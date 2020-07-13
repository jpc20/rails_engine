FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Number.between(from: 1, to: 20).round(0) }
    unit_price { Faker::Number.between(from: 10.00, to: 999.00).round(2) }
    item
    invoice
  end
end
