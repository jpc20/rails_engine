class Api::V1::Items::SearchController < ApplicationController
  def show
    attributes = params.except(*request.path_parameters.keys)
    item = Item.search(attributes)
    render json: ItemSerializer.new(item).serializable_hash
  end
end
