class Api::V1::Merchants::SearchController < ApplicationController
  def show
    attributes = params.except(*request.path_parameters.keys)
    merchant = Merchant.search(attributes).first
    render json: MerchantSerializer.new(merchant).serializable_hash
  end

  def index
    attributes = params.except(*request.path_parameters.keys)
    merchant = Merchant.search(attributes)
    render json: MerchantSerializer.new(merchant).serializable_hash
  end
end
