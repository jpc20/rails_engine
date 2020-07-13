class Api::V1::RevenueController < Api::V1::ApiController
  def index
    render_json(Merchant.most_revenue(params['quantity']), MerchantSerializer)
  end
end
