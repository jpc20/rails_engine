require 'date'

class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  validates :name, presence: true

  def self.search(params)
    merchants = Merchant.all
    params.each do |attribute, value|
      if ['created_at', 'updated_at'].include?(attribute)
        merchants = merchants.where("#{attribute} BETWEEN ? and ?", "%#{value.to_date.beginning_of_day}%", "%#{value.to_date.end_of_day}%")
      else
        merchants = merchants.where("#{attribute} like ?", "%#{value.downcase}%")
      end
    end
    merchants.first
  end

end
