require 'date'

class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  validates :name, presence: true

  def self.most_revenue(quantity)
    joins(invoices: :items).joins(invoices: :transactions)
    .select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .where('transactions.result = ?', 'success')
    .group('merchants.id')
    .order('revenue DESC')
    .limit(quantity)
  end
end
