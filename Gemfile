source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# i18n for enum
gem 'enum_help'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Repository for collecting Locale data for Ruby on Rails I18n
gem 'rails-i18n'
# Minimal authorization through OO design and pure Ruby classes
gem "pundit"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# Translations for the devise gem
gem 'devise-i18n'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Create beautiful JavaScript charts with one line of Ruby https://www.chartkick.com
gem 'chartkick'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
source 'https://rails-assets.org' do
  # The most popular front-end framework for developing responsive, mobile first projects on the web.
  gem 'rails-assets-bootstrap'
  # A simple, versatile notification library
  gem 'rails-assets-notifyjs'
  # Wrappers for JavaScript alert(), confirm() and other flexible dialogs using Twitter's bootstrap framework
  gem 'rails-assets-bootbox'
end

# Rails gem of the Bootstrap based admin theme SB Admin 2. https://github.com/dreamingechoes/bootstrap_sb_admin_base_v2
gem 'bootstrap_sb_admin_base_v2'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# For Excel imports
gem "roo", '~> 2.7.0'
gem 'roo-xls'

group :production do
  gem 'pg'
end

gem 'kaminari'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Catches mail and serves it through a dream.
  gem 'mailcatcher'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Better error page for Rack apps
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails'
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Generate Entity-Relationship Diagrams for Rails applications http://voormedia.github.io/rails-erd/
  gem 'rails-erd'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
