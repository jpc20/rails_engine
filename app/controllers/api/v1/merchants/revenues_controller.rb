class Api::V1::Merchants::RevenuesController < Api::V1::ApiController
  def index
    render_json(Merchant.most_revenue(params['quantity']), MerchantSerializer)
  end
  
  def show
    render json: {
                  data: {
                    id: nil,
                    attributes: {
                      revenue: Merchant.find(params[:id]).total_revenue
                    }
                  }
                }
  end
end
