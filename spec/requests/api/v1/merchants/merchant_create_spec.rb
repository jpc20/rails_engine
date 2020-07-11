require 'rails_helper'

describe "Merchant create endpoint" do
  it "creates a new merchant" do
    merchant_params = { name: 'New Merchant' }

    post '/api/v1/merchants', params: merchant_params
    merchant = Merchant.last
    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(merchant.name).to eq(merchant_params[:name])
  end
end
