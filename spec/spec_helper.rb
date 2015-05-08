require 'rspec'
require 'pg'
require 'stylist'
require 'client'

DB = PG.connect({:dbname => 'hair_salon'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylist *;")
    DB.exec("DELETE FROM client *;")
  end
end
