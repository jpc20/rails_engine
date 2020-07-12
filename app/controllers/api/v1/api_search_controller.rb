class Api::V1::ApiSearchController < Api::V1::ApiController

  private

  def render_one(type, serializer)
    render_json(type.search(attributes).first, serializer)
  end

  def render_all(type, serializer)
    render_json(type.search(attributes), serializer)
  end

  def attributes
    params.except(*request.path_parameters.keys)
  end

end
