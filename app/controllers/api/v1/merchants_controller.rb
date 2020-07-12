class Api::V1::MerchantsController < Api::V1::ApiController
  def index
    render_all(Merchant, MerchantSerializer)
  end

  def show
    render_one(Merchant, params[:id], MerchantSerializer)
  end

  def create
    new_merchant = Merchant.create(merchant_params)
    render json: MerchantSerializer.new(new_merchant).serializable_hash
  end

  def destroy
    merchant = Merchant.find(params[:id])
    merchant.delete
    render json: MerchantSerializer.new(merchant).serializable_hash
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)
    render json: MerchantSerializer.new(merchant).serializable_hash
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
