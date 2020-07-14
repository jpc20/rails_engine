require 'rails_helper'

describe "Merchant revenue endpoint" do
  it "can return the revenue for a merchant" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, unit_price: 99.82, merchant_id: merchant1.id)
    item2 = create(:item, unit_price: 1234.445, merchant_id: merchant1.id)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 10, unit_price: item1.unit_price)
    create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, quantity: 20, unit_price: item2.unit_price)
    create(:transaction, invoice_id: invoice1.id)
    create(:transaction, invoice_id: invoice2.id)

    get "/api/v1/merchants/#{merchant1.id}/revenue"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    revenue = JSON.parse(response.body, symbolize_names: true)

    expect(revenue[:data][:attributes][:revenue].to_f.round(2)).to eq(998.20)
  end
end
