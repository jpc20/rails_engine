require 'rails_helper'

describe "Revenue with date range endpoint" do
  it "returns the total revenue for all merchants accross the date range" do
    # merchant1 = create(:merchant)
    # merchant2 = create(:merchant)
    # merchant3 = create(:merchant)
    # merchant4 = create(:merchant)
    item1 = create(:item, unit_price: 10.00)
    item2 = create(:item, unit_price: 10.00)
    item3 = create(:item, unit_price: 10.00)
    item4 = create(:item, unit_price: 10.00)
    invoice1 = create(:invoice)
    # invoice2 = create(:invoice, merchant_id: merchant2.id)
    # invoice3 = create(:invoice, merchant_id: merchant3.id)
    # invoice4 = create(:invoice, merchant_id: merchant4.id)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 1, unit_price: item1.unit_price)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item2.id, quantity: 1, unit_price: item2.unit_price)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item3.id, quantity: 1, unit_price: item2.unit_price)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item4.id, quantity: 1, unit_price: item4.unit_price)
    create(:transaction, invoice_id: invoice1.id, created_at: "2012-03-11 15:33:57")
    create(:transaction, invoice_id: invoice1.id, created_at: "2012-03-11 15:33:57")
    create(:transaction, invoice_id: invoice1.id)

    get '/api/v1/revenue?start=2012-03-09&end=2012-03-24'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    revenue = JSON.parse(response.body)

    expect(revenue['data']['attributes']['revenue']).to eq(20)
  end
end
