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
  load_merchants(merchants)
  load_items(items)
  require "pry"; binding.pry
end

def load_merchants(file)
  CSV.foreach("./lib/data/#{file}", headers: true, header_converters: :symbol) do |row|
    Merchant.create!({name: row[:name]})
  end
end

def load_items(file)
  CSV.foreach("./lib/data/#{file}", headers: true, header_converters: :symbol) do |row|
    Item.create!({
                  name: row[:name],
                  description: row[:description],
                  unit_price: row[:unit_price].to_f / 100,
                  merchant_id: row[:merchant_id]
                })
  end
end
