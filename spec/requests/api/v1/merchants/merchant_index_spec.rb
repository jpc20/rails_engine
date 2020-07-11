require 'rails_helper'

describe "Merchant index endpoint" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(3)
    expect(merchants['data'].first['type']).to eq('merchant')
  end
end
