class Api::V1::RevenueController < Api::V1::ApiController
  def index
    render json: {
                  data: {
                    id: nil,
                    attributes: {
                      revenue: Transaction.total_revenue(params['start'], params['end'])
                    }
                  }
                }
  end
end
