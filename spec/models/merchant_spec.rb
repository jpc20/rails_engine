require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should have_many(:invoices)}
    it {should have_many(:items)}
  end

  describe 'methods' do
    it "search" do
      merchant1 = create(:merchant, name: "Walgreens Store")
      merchant2 = create(:merchant)
      params = {"name"=>"green", "created_at"=>"#{merchant1.created_at.to_s.split[0]}", "updated_at"=>"#{merchant1.updated_at.to_s.split[0]}"}
      expect(Merchant.search(params).first).to eq(merchant1)
    end

    it "most_revenue" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
      merchant4 = create(:merchant)
      create(:merchant)
      item1 = create(:item, unit_price: 999.82, merchant_id: merchant1.id)
      item2 = create(:item, unit_price: 754.33, merchant_id: merchant2.id)
      item3 = create(:item, unit_price: 123.45, merchant_id: merchant3.id)
      item4 = create(:item, unit_price: 103.45, merchant_id: merchant4.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id)
      invoice3 = create(:invoice, merchant_id: merchant3.id)
      invoice4 = create(:invoice, merchant_id: merchant4.id)
      create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 10, unit_price: item1.unit_price)
      create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, quantity: 8, unit_price: item2.unit_price)
      create(:invoice_item, invoice_id: invoice3.id, item_id: item3.id, quantity: 6, unit_price: item2.unit_price)
      create(:invoice_item, invoice_id: invoice4.id, item_id: item4.id, quantity: 4, unit_price: item4.unit_price)
      create(:transaction, invoice_id: invoice1.id)
      create(:transaction, invoice_id: invoice2.id)
      create(:transaction, invoice_id: invoice4.id)

      expect(Merchant.most_revenue(2).first).to eq(merchant1)
      expect(Merchant.most_revenue(2).last).to eq(merchant2)
    end

    it "most_items_sold" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
      merchant4 = create(:merchant)
      create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
      item2 = create(:item, merchant_id: merchant2.id)
      item3 = create(:item, merchant_id: merchant3.id)
      item4 = create(:item, merchant_id: merchant4.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id)
      invoice3 = create(:invoice, merchant_id: merchant3.id)
      invoice4 = create(:invoice, merchant_id: merchant4.id)
      create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 10)
      create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, quantity: 8)
      create(:invoice_item, invoice_id: invoice3.id, item_id: item3.id, quantity: 6)
      create(:invoice_item, invoice_id: invoice4.id, item_id: item4.id, quantity: 14)
      create(:transaction, invoice_id: invoice1.id)
      create(:transaction, invoice_id: invoice2.id)
      create(:transaction, invoice_id: invoice4.id)

      expect(Merchant.most_items_sold(2).first).to eq(merchant4)
      expect(Merchant.most_items_sold(2).last).to eq(merchant1)
    end

    it "total_revenue" do
      merchant1 = create(:merchant)
      item1 = create(:item, unit_price: 99.82, merchant_id: merchant1.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 10, unit_price: item1.unit_price)
      create(:transaction, invoice_id: invoice1.id)

      expect(merchant1.total_revenue.round(2)).to eq(998.20)
    end
  end
end
