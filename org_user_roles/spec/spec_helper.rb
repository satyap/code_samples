require 'factory_girl'
require 'database_cleaner'
require 'active_record'
require_relative '../user'
require_relative '../organization'
require_relative '../role'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  config.after(:suite) do
    FileUtils.rm_f("example.db")
  end
end

FactoryGirl.definition_file_paths << Pathname.new(".//factories")
FactoryGirl.definition_file_paths.uniq!
FactoryGirl.find_definitions

FileUtils.rm_f("example.db")
`sqlite3 example.db < spec/test.sql`

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'example.db'
)

ActiveRecord::Base.logger = Logger.new(STDOUT) if ENV['DEBUG']
