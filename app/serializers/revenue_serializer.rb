class RevenueSerializer
  include FastJsonapi::ObjectSerializer

  attribute :revenue do |obj|
    obj.amount
  end
end
