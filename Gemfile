source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails'

# Authentication
gem 'devise'
gem 'devise-i18n'

# CanCanCan is an authorization library for Ruby on Rails which restricts what resources a given user is allowed to access.
gem 'cancancan'

# Web-server
gem 'thin'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Foundation Official Gem
gem 'foundation-rails'

# Foundation icon 3
gem 'foundation-icons-sass-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Globalize builds on the I18n API in Ruby on Rails to add model translations to ActiveRecord models.
gem 'globalize'

# Easily access (read and write) globalize translated fields without fiddling with locale
gem 'globalize-accessors', github: 'globalize/globalize-accessors', branch: 'master'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors'
  gem 'bullet'
  gem 'meta_request'
  gem 'binding_of_caller'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'forem', github: 'radar/forem', branch: 'rails4'

gem 'will_paginate'
gem 'will-paginate-i18n'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rspec-collection_matchers'
  gem 'guard-rspec'
  # gem 'shoulda-matchers', '~> 2.6.2'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end

# ready-for-use HTML text editor
gem 'ckeditor', git: 'git://github.com/galetahub/ckeditor.git'

# Paperclip file attachment library
gem 'paperclip', git: 'git://github.com/thoughtbot/paperclip.git'

# Calendar javascript lib
gem 'fullcalendar-rails'
# Parse, validate, manipulate, and display dates in javascript. (fullcalendar dependency)
gem 'momentjs-rails'

# Use jquery-ui library
gem 'jquery-ui-rails'

# Handle settings with caching, manages a table of global key, value pairs.
gem 'rails-settings-cached'

# PgSearch builds named scopes that take advantage of PostgreSQL's full text search.
gem 'pg_search'

# A gem which helps you detect the users preferred language, as sent by the "Accept-Language" HTTP header.
gem 'http_accept_language', git: 'git://github.com/iain/http_accept_language.git'

# Central point to collect locale data for use in Ruby on Rails.
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'master'

group :production, :stagin do
  gem 'rails_12factor'
end