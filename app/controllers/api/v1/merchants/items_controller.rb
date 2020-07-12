class Api::V1::Merchants::ItemsController < Api::V1::ApiController
  def index
    render_json(Merchant.find(params[:id]).items, ItemSerializer)
  end
end
