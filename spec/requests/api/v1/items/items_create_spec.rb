require 'rails_helper'

describe "Item create endpoint" do
  it "creates an item" do
    merchant = create(:merchant)
    item_params = {
                    name: 'New Item',
                    description: 'New description',
                    unit_price: 784.82,
                    merchant_id: merchant.id
                  }

    post "/api/v1/items", params: item_params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    item = Item.last

    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
    expect(item.unit_price).to eq(item_params[:unit_price])
    expect(item.merchant_id).to eq(merchant.id)
  end
end
