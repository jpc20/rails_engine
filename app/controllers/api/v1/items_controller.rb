class Api::V1::ItemsController < Api::V1::ApiController
  def index
    render_json(Item.all, ItemSerializer)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]), include: [:merchant])
  end

  def create
    create_and_render(Item, item_params, ItemSerializer)
  end

  def destroy
    destroy_and_render(Item.find(params[:id]), ItemSerializer)
  end

  def update
    update_and_render(Item.find(params[:id]), item_params, ItemSerializer)
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end
