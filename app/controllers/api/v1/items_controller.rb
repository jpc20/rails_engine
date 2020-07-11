class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: ItemSerializer.new(items).serializable_hash
  end

  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item).serializable_hash
  end
end
