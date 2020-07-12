class Api::V1::Items::SearchController < Api::V1::ApiSearchController
  def show
    render_one(Item, ItemSerializer)
  end

  def index
    render_all(Item, ItemSerializer)
  end
end
