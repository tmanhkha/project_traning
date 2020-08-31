# frozen_string_literal: false

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'shoulda-matchers', '~> 4.0'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.7', '>= 4.7.2'
gem 'jbuilder', '~> 2.7'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'rubocop-rails'
gem 'sass-rails', '>= 6'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 4.0'
