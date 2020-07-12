class Api::V1::ApiSearchController < ApplicationController

  private

  def render_one(type, serializer)
    object = type.search(attributes).first
    render json: serializer.new(object).serializable_hash
  end

  def render_all(type, serializer)
    object = type.search(attributes)
    render json: serializer.new(object).serializable_hash
  end

  def attributes
    params.except(*request.path_parameters.keys)
  end

end
