require 'date'

class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  validates :name, presence: true

  def self.search(params)
    merchants = []
    params.each do |attribute, value|
      if attribute == 'created_at'
        merchants << Merchant.where("created_at BETWEEN ? and ?", "%#{value.to_date.beginning_of_day}%", "%#{value.to_date.end_of_day}%")
      elsif attribute == 'updated_at'
        merchants << Merchant.where("updated_at BETWEEN ? and ?", "%#{value.to_date.beginning_of_day}%", "%#{value.to_date.end_of_day}%")
      else
        merchants << Merchant.where("#{attribute} like ?", "%#{value}%")
      end
    end
    merchants.first.first
  end

end
