require 'active_record'
require 'spec_helper'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
ActiveRecord::Migration.create_table :users do |t|
  t.timestamps
end

RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end

I18n.load_path = Dir['spec/*.yml']
I18n.backend.load_translations
