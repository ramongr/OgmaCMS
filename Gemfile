source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1.8'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.17.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.5'

# Authentication
gem 'devise', '~> 3.4.1'
gem 'devise-i18n', '~> 0.11.2'

# CanCanCan is an authorization library for Ruby on Rails which restricts what resources a given user is allowed to access.
gem 'cancancan', '~> 1.9.2'

# Web-server
gem 'thin', '~> 1.6.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.6.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', '~> 0.12.1', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 3.0.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.3'
gem 'jquery-turbolinks', '~> 2.1.0'

# Foundation Official Gem
gem 'foundation-rails', '~> 5.4.5.0'

# Foundation icon 3
gem 'foundation-icons-sass-rails', '~> 3.0.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.2.5'

# Globalize builds on the I18n API in Ruby on Rails to add model translations to ActiveRecord models.
gem 'globalize', '~> 4.0.3'

# Easily access (read and write) globalize translated fields without fiddling with locale
gem 'globalize-accessors', '~> 0.1.5', github: 'globalize/globalize-accessors', branch: 'master'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.1', require: false
end

group :development do
  gem 'better_errors', '~> 2.0.0'
  gem 'bullet', '~> 4.14.0'
  gem 'meta_request', '~> 0.3.4'
  gem 'binding_of_caller', '~> 0.7.2'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'forem', '~> 1.0.0.beta1', github: 'radar/forem', branch: 'rails4'

gem 'will_paginate', '~> 3.0.7'
gem 'will-paginate-i18n', '~> 0.1.15'

group :development, :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'rspec-collection_matchers', '~> 1.1.2'
  gem 'guard-rspec', '~> 4.4.2'
  # gem 'shoulda-matchers', '~> 2.6.2'
end

group :test do
  gem 'faker', '~> 1.4.3'
  gem 'capybara', '~> 2.4.4'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'launchy', '~> 2.4.3'
  gem 'selenium-webdriver', '~> 2.44.0'
end

# ready-for-use HTML text editor
gem 'ckeditor', '~> 4.1.1', git: 'git://github.com/galetahub/ckeditor.git'

# Paperclip file attachment library
gem 'paperclip', '~> 4.2.0', git: 'git://github.com/thoughtbot/paperclip.git'

# Calendar javascript lib
gem 'fullcalendar-rails', '~> 2.2.3.0'

# Parse, validate, manipulate, and display dates in javascript. (fullcalendar dependency)
gem 'momentjs-rails', '~> 2.8.3'

# Use jquery-ui library
gem 'jquery-ui-rails', '~> 5.0.3'

# Handle settings with caching, manages a table of global key, value pairs.
gem 'rails-settings-cached', '~> 0.4.1'

# PgSearch builds named scopes that take advantage of PostgreSQL's full text search.
gem 'pg_search', '~> 0.7.8'

# A gem which helps you detect the users preferred language, as sent by the "Accept-Language" HTTP header.
gem 'http_accept_language', '~> 2.0.2', git: 'git://github.com/iain/http_accept_language.git'

# Central point to collect locale data for use in Ruby on Rails.
gem 'rails-i18n', '~> 4.0.3', github: 'svenfuchs/rails-i18n', branch: 'master'

# Cron job manager
gem 'rufus-scheduler', '3.0.9'

group :production, :stagin do
  gem 'rails_12factor', '~> 0.0.3'
end