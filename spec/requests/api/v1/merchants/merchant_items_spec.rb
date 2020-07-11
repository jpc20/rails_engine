require 'rails_helper'

describe "Merchant items index endpoint" do
  it "sends a list the merchants items" do
    merchant = create(:merchant)
    merchant.items.create({
                            name: 'new item',
                            description: 'new item description',
                            unit_price: 123.45,
                          })
    merchant.items.create({
                            name: 'another item',
                            description: 'another item description',
                            unit_price: 155.45,
                          })
    create_list(:item, 7)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    items = JSON.parse(response.body)

    expect(items['data'].count).to eq(2)
    expect(items['data'].first['type']).to eq('item')
    expect(items['data'].first['attributes']['unit_price'].class).to eq(Float)
  end
end
