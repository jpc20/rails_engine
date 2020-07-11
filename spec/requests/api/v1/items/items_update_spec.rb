require 'rails_helper'

describe "Item create endpoint" do
  it "creates an item" do
    item = create(:item)
    previous_name = item.name
    previous_description = item.description
    previous_unit_price = item.unit_price
    item_params = {
                    name: 'New Name',
                    description: 'New description',
                    unit_price: 123.45
                  }

    put "/api/v1/items/#{item.id}", params: item_params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    item = Item.find(item.id)

    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
    expect(item.unit_price).to eq(item_params[:unit_price])
    expect(item.name).to_not eq(previous_name)
    expect(item.description).to_not eq(previous_description)
    expect(item.unit_price).to_not eq(previous_unit_price)
  end
end
