require 'fileutils'
require 'logger'
require 'sequel'
require 'pact_broker'

# Create a real database, and set the credentials for it here
DATABASE_CREDENTIALS = {adapter: "postgres", user: ENV['PACT_BROKER_DATABASE_USERNAME'], password: ENV['PACT_BROKER_DATABASE_PASSWORD'], host: ENV['PACT_BROKER_DATABASE_HOST'], database: ENV['PACT_BROKER_DATABASE_NAME']}
# Have a look at the Sequel documentation to make decisions about things like connection pooling
# and connection validation.

use Rack::Auth::Basic, "secure" do |username, password|
  [username, password] == ['readonly', 'readonly']
end

app = PactBroker::App.new do | config |
  # change these from their default values if desired
  # config.log_dir = "./log"
  # config.auto_migrate_db = true
  # config.use_hal_browser = true
  config.database_connection = Sequel.connect(DATABASE_CREDENTIALS.merge(:logger => config.logger))
end

run app
