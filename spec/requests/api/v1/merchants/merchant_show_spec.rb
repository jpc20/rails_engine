require 'rails_helper'

describe "Merchant show endpoint" do
  it "sends a merchant" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    merchant_json = JSON.parse(response.body)
    expect(merchant_json['data']['id'].to_i).to eq(merchant.id)
  end
end
