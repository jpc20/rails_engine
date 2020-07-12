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

  def create_and_render(type, params, serializer)
    new_object = type.create(params)
    render json: serializer.new(new_object).serializable_hash
  end

  def destroy_and_render(type, id, serializer)
    object = type.find(id)
    object.destroy
    render json: serializer.new(object).serializable_hash
  end

  def update_and_render(type, id, params, serializer)
    object = type.find(id)
    object.update(params)
    render json: serializer.new(object).serializable_hash
  end
end
