ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'webmock/rspec'
require 'shoulda/matchers'
require 'support/spec_helper'
include ActionDispatch::TestProcess

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include ActionDispatch::TestProcess
  config.include FactoryBot::Syntax::Methods
  config.file_fixture_path = Rails.root.join('spec', 'support', 'fixtures')
  config.infer_spec_type_from_file_location!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
    with.library :rails
  end
end
