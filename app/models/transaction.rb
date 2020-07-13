class Transaction < ApplicationRecord
  belongs_to :invoice
  validates :result, presence: true
  validates :credit_card_number, presence: true

  def self.total_revenue(start, finish)
    joins(invoice: :invoice_items)
    .where('invoices.created_at BETWEEN ? AND ?', "#{start.to_date.beginning_of_day}", "#{finish.to_date.end_of_day}")
    .where('transactions.result = ?', 'success')
    .select('SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .group('transactions.id')
    .sum(&:revenue)
  end
end
