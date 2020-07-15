require 'csv'

task :import_data do
  Rake::Task['db:reset'].invoke
  merchants = "merchants.csv"
  items = "items.csv"
  customers = "customers.csv"
  invoices = "invoices.csv"
  invoice_items = "invoice_items.csv"
  transactions = "transactions.csv"
  import_objects(merchants, Merchant)
  import_objects(items, Item)
  import_objects(customers, Customer)
  import_objects(invoices, Invoice)
  import_objects(invoice_items, InvoiceItem)
  import_objects(transactions, Transaction)
  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end
end

def import_objects(file, type)
  puts "Importing #{type}s"
  CSV.foreach("./lib/data/#{file}", headers: true, header_converters: :symbol) do |row|
    row_hash = row.to_h
    row_hash[:unit_price] = row_hash[:unit_price].to_f / 100 if row_hash[:unit_price]
    type.create!(row_hash)
  end
end
