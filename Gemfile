source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg', '~> 1.1'
gem 'rails', '~> 5.2.3'

# Use Puma as the app server
gem 'bootsnap', '>= 1.1.0', require: false
gem 'puma', '~> 3.11'

# Use for versioning apis (api_version in routes)
gem 'versionist'

# Paginate
gem 'wor-paginate'

gem 'activeadmin', git: 'https://github.com/activeadmin/activeadmin'
gem 'rack-cors'
gem 'rspotify'

# Serializer
gem 'active_model_serializers'

gem 'rails-i18n'

gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: :mri

  # Lints
  gem 'rubocop', '~> 0.65.0', require: false
  gem 'rubocop-rspec', '~> 1.32'

  gem 'scss_lint', require: false

  # Static analysis for security vulnerabilities
  gem 'brakeman', require: false
  gem 'factory_bot_rails'
  gem 'faker', '1.9.1'

  # Loads ENV variables from .env file in base folder
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webmock'
end
