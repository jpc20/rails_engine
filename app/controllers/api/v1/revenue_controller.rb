class Api::V1::RevenueController < Api::V1::ApiController
  def index
    render_json(Transaction.total_revenue(params['start'], params['end']), RevenueSerializer)
  end
end
