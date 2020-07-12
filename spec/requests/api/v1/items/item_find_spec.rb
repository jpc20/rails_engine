require 'rails_helper'

describe "Item find endpoints" do
  it "single item find by name" do
    item1 = create(:item, name: "Toothpaste")
    item2 = create(:item)

    get "/api/v1/items/find?name=OOTH"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    item_json = JSON.parse(response.body)
    expect(item_json['data']['id'].to_i).to eq(item1.id)
  end

  it "single item find by created_at and unit_price" do
    item1 = create(:item, unit_price: 433.99)
    item2 = create(:item)

    get "/api/v1/items/find?created_at=#{item1.created_at}&unit_price=433"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    item_json = JSON.parse(response.body)
    expect(item_json['data']['id'].to_i).to eq(item1.id)
  end

  it "multiple items find by name" do
    item1 = create(:item, name: 'Colgate Toothpaste')
    item2 = create(:item, name: 'toothbrush')
    create(:item)

    get "/api/v1/items/find_all?name=tooth"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    items = JSON.parse(response.body)

    expect(items['data'].count).to eq(2)
    expect(items['data'].first['id'].to_i).to eq(item1.id)
    expect(items['data'].last['id'].to_i).to eq(item2.id)  end
end
