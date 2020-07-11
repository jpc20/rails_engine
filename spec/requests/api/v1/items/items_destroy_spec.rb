require 'rails_helper'

describe "Item destroy endpoint" do
  it "destroys an item" do
    item = create(:item)

    expect{ delete "/api/v1/items/#{item.id}" }.to change(Item, :count).by(-1)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
