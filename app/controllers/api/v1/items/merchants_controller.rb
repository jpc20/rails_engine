class Api::V1::Items::MerchantsController < Api::V1::ApiController
  def show
    render_json(Item.find(params[:id]).merchant, MerchantSerializer)
  end
end
