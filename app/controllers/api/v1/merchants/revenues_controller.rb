class Api::V1::Merchants::RevenuesController < Api::V1::ApiController
  def index
    render_json(Merchant.most_revenue(params['quantity']), MerchantSerializer)
  end

  def show
    render_json(Merchant.find(params[:id]), RevenueSerializer)
  end
end
