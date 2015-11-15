source 'https://rubygems.org'



ruby "2.1.5"

gem 'rails', '4.2.4'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'

gem 'turbolinks'

gem 'jbuilder', '~> 2.0'

gem 'sdoc', '~> 0.4.0', group: :doc


gem 'bcrypt', '~> 3.1.7'

gem "pry", "0.10.3"

gem "pry-nav"

gem "kaminari"

gem 'materialize-sass'

gem "font-awesome-rails"

gem 'valid_url', '~> 0.0.4'

gem 'simplecov', require: false

gem "coveralls", require: false

gem "codeclimate-test-reporter", group: :test, require: nil

group :production do
  gem 'pg', '0.17.1'
  gem "rails_12factor", "0.0.2"
  gem 'puma'
end


group :development, :test do
  gem 'byebug', "6.0.2"
  gem "travis"
  gem "rspec-rails"
  gem "sqlite3"
  gem "database_cleaner"
end

group :test do
  gem "capybara"
  gem 'selenium-webdriver'
end

group :development do

  gem 'web-console', '~> 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

