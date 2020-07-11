require 'rails_helper'

describe "Merchant destroy endpoint" do
  it "destroys a merchant" do
    merchant = create(:merchant)

    expect{ delete "/api/v1/merchants/#{merchant.id}" }.to change(Merchant, :count).by(-1)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
