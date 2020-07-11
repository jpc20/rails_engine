require 'rails_helper'

describe "Merchant update endpoint" do
  it "updates a merchant" do
    merchant = create(:merchant)
    previous_name = merchant.name
    merchant_params = { name: 'Updated Name' }

    put "/api/v1/merchants/#{merchant.id}", params: merchant_params
    merchant = Merchant.find(merchant.id)
    expect(response).to be_successful

    expect(merchant.name).to_not eq(previous_name)
    expect(merchant.name).to eq(merchant_params[:name])
  end
end
