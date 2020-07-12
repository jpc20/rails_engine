class Item < ApplicationRecord
  belongs_to :merchant
  validates :name, presence: true
  validates :unit_price, presence: true
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
end
