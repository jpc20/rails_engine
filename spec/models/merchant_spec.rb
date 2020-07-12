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
  end
end
