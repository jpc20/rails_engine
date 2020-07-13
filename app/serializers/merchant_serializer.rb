class MerchantSerializer < JSONAPI::Serializable::Resource
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
