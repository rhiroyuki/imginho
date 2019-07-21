# frozen_string_literal: true

ruby "~> 2.6.3"

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}"}

gem "puma"
gem "pry"
gem "rake"
gem "roda"

gem "tilt"
gem "sassc"

group :development, :test do
  gem "dotenv"
  gem "rspec"
end

group :development do
  gem "foreman"
  gem "rerun"
end

group :test do
  gem "capybara"
  gem "rack-test"
  gem "selenium-webdriver"
end
