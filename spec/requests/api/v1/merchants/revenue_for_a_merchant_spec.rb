require 'rails_helper'

describe "Merchant revenue endpoint" do
  it "can return the revenue for a merchant" do
    merchant1 = create(:merchant)
    item1 = create(:item, unit_price: 99.82, merchant_id: merchant1.id)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 10, unit_price: item1.unit_price)
    create(:transaction, invoice_id: invoice1.id)

    get "/api/v1/merchants/#{merchant1.id}/revenue"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    revenue = JSON.parse(response.body, symbolize_names: true)

    expect(revenue[:data][:attributes][:revenue].to_f).to eq(9982.00)
  end
end
