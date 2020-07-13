class RevenueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  attribute :revenue do |merchant|
    merchant.revenue
  end
end
