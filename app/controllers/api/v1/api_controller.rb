class Api::V1::ApiController < ApplicationController

  private

  def render_json(obj, serializer)
    render json: serializer.new(obj).serializable_hash
  end

  def create_and_render(type, params, serializer)
    new_object = type.create(params)
    render_json(new_object, serializer)
  end

  def destroy_and_render(object, serializer)
    object.destroy
    render_json(object, serializer)
  end

  def update_and_render(object ,params, serializer)
    object.update(params)
    render_json(object, serializer)
  end
end
