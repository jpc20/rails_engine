require 'rails_helper'

describe "Item merchant index endpoint" do
  it "sends the merchant associated with an item" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)

    item = create(:item, merchant_id: merchant1.id)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    merchant_json = JSON.parse(response.body)

    merchant_json = JSON.parse(response.body)
    expect(merchant_json['data']['id'].to_i).to eq(merchant1.id)
  end
end
