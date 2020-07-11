class MerchantSerializer < JSONAPI::Serializable::Resource
  include FastJsonapi::ObjectSerializer
  has_many :invoices
  has_many :items
  attributes :id, :name
end
