require 'rails_helper'

describe "Merchant most revenue endpoint" do
  it "can return the top 3 merchants based on revenue" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)
    create(:merchant)
    create(:merchant)
    item1 = create(:item, unit_price: 999.82)
    item2 = create(:item, unit_price: 754.33)
    item3 = create(:item, unit_price: 123.45)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id)
    invoice3 = create(:invoice, merchant_id: merchant3.id)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id)
    create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id)
    create(:invoice_item, invoice_id: invoice3.id, item_id: item3.id)

    get '/api/v1/merchants/most_revenue?quantity=3'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(3)
    expect(merchants['data'].first['attributes']['id'].to_i).to eq(merchant1.id)
    expect(merchants['data'][1]['attributes']['id'].to_i).to eq(merchant2.id)
    expect(merchants['data'].last['attributes']['id'].to_i).to eq(merchant3.id)
  end
end
