class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.total_revenue(start, finish)
    joins(:invoice_items, :transactions)
    .where('invoices.created_at BETWEEN ? AND ?', "#{start.to_date.beginning_of_day}", "#{finish.to_date.end_of_day}")
    .merge(Transaction.successful)
    .select('SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .group(:id)
    .sum(&:revenue)
  end
end
