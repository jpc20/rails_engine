class Api::V1::Merchants::ItemsSoldController < Api::V1::ApiController
  def index
    render_json(Merchant.most_items_sold(params['quantity']), MerchantSerializer)
  end
end
