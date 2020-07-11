class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: ItemSerializer.new(items).serializable_hash
  end

  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item).serializable_hash
  end

  def create
    item = Item.create(item_params)
    render json: ItemSerializer.new(item).serializable_hash
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: ItemSerializer.new(item).serializable_hash
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end
