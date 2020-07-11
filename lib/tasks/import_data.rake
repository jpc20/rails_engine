require 'csv'

task :import_data do
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end
  merchants = "merchants.csv"
  items = "items.csv"
  customers = "customers.csv"
  invoices = "invoices.csv"
  import_merchants(merchants)
  import_items(items)
  import_customers(customers)
  import_invoices(invoices)
  require "pry"; binding.pry
end

def import_merchants(file)
  CSV.foreach("./lib/data/#{file}", headers: true, header_converters: :symbol) do |row|
    Merchant.create!({name: row[:name]})
  end
end

def import_items(file)
  CSV.foreach("./lib/data/#{file}", headers: true, header_converters: :symbol) do |row|
    Item.create!({
                  name: row[:name],
                  description: row[:description],
                  unit_price: row[:unit_price].to_f / 100,
                  merchant_id: row[:merchant_id]
                })
  end
end

def import_customers(file)
  CSV.foreach("./lib/data/#{file}", headers: true, header_converters: :symbol) do |row|
    Customer.create!({
                  first_name: row[:first_name],
                  last_name: row[:last_name]
                })
  end
end

def import_invoices(file)
  CSV.foreach("./lib/data/#{file}", headers: true, header_converters: :symbol) do |row|
    Invoice.create!({
                  customer_id: row[:customer_id],
                  merchant_id: row[:merchant_id],
                  status: row[:status]
                })
  end
end
