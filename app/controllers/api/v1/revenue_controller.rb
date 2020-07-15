class Api::V1::RevenueController < Api::V1::ApiController
  def index
    revenue = Revenue.new(Invoice.total_revenue(params['start'], params['end']))
    render_json(revenue, RevenueSerializer)
  end
end
