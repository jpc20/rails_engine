class Api::V1::Merchants::SearchController < Api::V1::ApiSearchController
  def show
    render_one(Merchant, MerchantSerializer)
  end

  def index
    render_all(Merchant, MerchantSerializer)
  end
end
