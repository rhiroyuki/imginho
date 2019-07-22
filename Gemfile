# frozen_string_literal: true

ruby "~> 2.6.3"

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}"}

gem "roda"
gem "sequel"
gem "pg"
gem "puma"
gem "pry"
gem "rake"
gem "zeitwerk"

gem "forme"
gem "tilt"
gem "sassc"

group :production do
  gem "newrelic_rpm"
  gem "librato-rack"
end

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
