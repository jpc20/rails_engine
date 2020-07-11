require 'rails_helper'

describe "Item show endpoint" do
  it "sends one item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    item_json = JSON.parse(response.body)

    expect(item_json['data']['id'].to_i).to eq(item.id)
  end
end
