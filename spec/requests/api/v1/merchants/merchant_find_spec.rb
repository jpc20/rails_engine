require 'rails_helper'

describe "Merchant find endpoints" do
  it "single merchant find by name" do
    merchant1 = create(:merchant, name: "Walgreens Store")
    create(:merchant)

    get "/api/v1/merchants/find?name=green"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    merchant_json = JSON.parse(response.body)
    expect(merchant_json['data']['id'].to_i).to eq(merchant1.id)
  end

  it "single merchant find by created_at and name" do
    merchant1 = create(:merchant, name: "Walgreens Store")
    create(:merchant)

    get "/api/v1/merchants/find?created_at=#{merchant1.created_at}&name=green"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    merchant_json = JSON.parse(response.body)
    expect(merchant_json['data']['id'].to_i).to eq(merchant1.id)
  end

  it "multiple merchant find by name" do
    merchant1 = create(:merchant, name: "Walgreens Store")
    merchant2 = create(:merchant, name: "Wintergreen")
    create(:merchant)

    get "/api/v1/merchants/find_all?name=green"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(2)
    expect(merchants['data'].first['id'].to_i).to eq(merchant1.id)
    expect(merchants['data'].last['id'].to_i).to eq(merchant2.id)
  end
end
