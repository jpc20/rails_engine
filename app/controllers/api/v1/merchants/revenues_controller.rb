class Api::V1::Merchants::RevenuesController < Api::V1::ApiController
  def index
    render_json(Merchant.most_revenue(params['quantity']), RevenueSerializer)
  end
end
