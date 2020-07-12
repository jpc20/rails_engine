class Api::V1::MerchantsController < Api::V1::ApiController
  def index
    render_json(Merchant.all, MerchantSerializer)
  end

  def show
    render_json(Merchant.find(params[:id]), MerchantSerializer)
  end

  def create
    create_and_render(Merchant, merchant_params, MerchantSerializer)
  end

  def destroy
    destroy_and_render(Merchant.find(params[:id]), MerchantSerializer)
  end

  def update
    update_and_render(Merchant.find(params[:id]), merchant_params, MerchantSerializer)
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
