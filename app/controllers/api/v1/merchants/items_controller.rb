class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    merchant = Merchant.find(params[:id])
    render json: ItemSerializer.new(merchant.items).serializable_hash
  end
end
