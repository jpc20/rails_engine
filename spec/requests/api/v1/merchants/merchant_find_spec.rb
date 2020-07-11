require 'rails_helper'

describe "Merchant find endpoints" do
  it "single merchant find by name" do
    merchant1 = create(:merchant, name: "Walgreens Store")
    merchant2 = create(:merchant)

    get "/api/v1/merchants/find?name=green"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    merchant_json = JSON.parse(response.body)
    expect(merchant_json['data']['id'].to_i).to eq(merchant1.id)
  end

  it "single merchant find by created_at" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)

    get "/api/v1/merchants/find?created_at=#{merchant1.created_at}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    merchant_json = JSON.parse(response.body)
    expect(merchant_json['data']['id'].to_i).to eq(merchant1.id)
  end
end
