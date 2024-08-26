source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.6'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'elasticsearch', '7.13.3'
gem 'elasticsearch-dsl', '0.1.10'
gem 'elasticsearch-model', '7.2.1'
gem 'redis'

gem 'lograge'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'psych', '~> 3.1'

gem 'activerecord-sqlserver-adapter', '6.0.0'
gem 'ddtrace', '1.4.0'
gem 'dogstatsd-ruby', '5.5.0'
gem 'google-protobuf', '3.19.4'

gem 'parallel'

gem 'aws-sdk-dynamodb', '1.85.0'
gem 'aws-sdk-rails', '3.6.1'
gem 'aws-sdk-s3', '1.140.0'

gem 'dynamoid', '3.7.1'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bullet'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'rspec-json_expectations'
  gem 'parallel_tests'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.9'
  gem 'pre-commit', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-performance', require: false
  gem 'slim_lint', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'heavens_door'
end

group :test do
  gem 'arproxy'
  gem 'capybara', '~> 3.39.2'
  gem 'cuprite'
  gem 'database_cleaner'
  gem 'factory_bot_rails', require: false
  gem 'faker'
  gem 'rack_session_access'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
end
