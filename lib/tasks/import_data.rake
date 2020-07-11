require 'csv'

task :import_data do
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end
  merchants = "merchants.csv"
  load_merchants(merchants, Merchant)
end

def load_merchants(file, model)
  CSV.foreach("./lib/data/#{file}", headers: true, header_converters: :symbol) do |row|
    model.create!({name: row[:name]})
  end
  require "pry"; binding.pry
end
