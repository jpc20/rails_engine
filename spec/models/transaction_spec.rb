require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'relationships' do
    it {should belong_to(:invoice)}
  end

  describe 'validations' do
    it {should validate_presence_of(:credit_card_number)}
    it {should validate_presence_of(:result)}
  end

  describe 'methods' do
    it "total_revenue" do
      item1 = create(:item, unit_price: 10.00)
      item2 = create(:item, unit_price: 10.00)
      item3 = create(:item, unit_price: 10.00)
      item4 = create(:item, unit_price: 10.00)
      invoice1 = create(:invoice, created_at: "2012-03-11 15:33:57")
      invoice2 = create(:invoice, created_at: "2012-03-11 15:33:57")
      create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 1, unit_price: item1.unit_price)
      create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, quantity: 1, unit_price: item2.unit_price)
      create(:invoice_item, item_id: item3.id, quantity: 1, unit_price: item2.unit_price)
      create(:invoice_item, item_id: item4.id, quantity: 1, unit_price: item4.unit_price)
      create(:transaction, invoice_id: invoice1.id)
      create(:transaction, invoice_id: invoice2.id)
      create(:transaction)

      expect(Transaction.total_revenue("2012-03-10", "2012-03-12")).to eq(20.00)
    end
  end
end
