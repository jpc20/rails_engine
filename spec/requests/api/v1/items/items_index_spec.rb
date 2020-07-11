require 'rails_helper'

describe "Item index endpoint" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    items = JSON.parse(response.body)

    expect(items['data'].count).to eq(3)
    expect(items['data'].first['type']).to eq('item')
    expect(items['data'].first['attributes']['unit_price'].class).to eq(Float)
  end
end
