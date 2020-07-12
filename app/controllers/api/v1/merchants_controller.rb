class Api::V1::MerchantsController < Api::V1::ApiController
  def index
    render_all(Merchant, MerchantSerializer)
  end

  def show
    render_one(Merchant, params[:id], MerchantSerializer)
  end

  def create
    create_and_render(Merchant, merchant_params, MerchantSerializer)
  end

  def destroy
    destroy_and_render(Merchant, params[:id], MerchantSerializer)
  end

  def update
    update_and_render(Merchant, params[:id], merchant_params, MerchantSerializer)
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
