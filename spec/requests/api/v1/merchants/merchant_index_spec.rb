require 'rails_helper'

describe "Merchant index endpoint" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
    expect(merchants.first.class).to eq(Merchant)
    expect(merchants.lastg.class).to eq(Merchant)
  end
end
