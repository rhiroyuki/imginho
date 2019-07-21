# frozen_string_literal: true

require "bundler/setup"

Bundler.require(:default, ENV["APP_ENV"] || :development)

require "dotenv/load" if defined?(Dotenv)

require_relative "config/application"

Dir.glob("config/initializers/**/*.rb", base: __dir__).each { |f| require_relative f }

require_relative "config/environment"

if Application.production?
  require "newrelic_rpm"
end

loader = Zeitwerk::Loader.new
app_path = File.expand_path(__dir__)

Dir.glob("app/**").select { |f| File.directory? f }.each do |dir|
  loader.push_dir([app_path, dir].join("/"))
end

loader.setup

require_relative "config/routes"
