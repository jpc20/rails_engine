class RevenueSerializer
  include FastJsonapi::ObjectSerializer

  attribute :revenue do |obj|
    obj.total_revenue
  end
end
