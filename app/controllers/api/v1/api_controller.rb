class Api::V1::ApiController < ApplicationController

  private

  def render_all(type, serializer)
    objects = type.all
    render json: serializer.new(objects).serializable_hash
  end

  def render_one(type, id, serializer)
    object = type.find(id)
    render json: serializer.new(object).serializable_hash
  end
end
