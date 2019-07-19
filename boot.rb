# frozen_string_literal: true

require "bundler/setup"

Bundler.require(:default, ENV["APP_ENV"] || :development)

require "dotenv/load" if defined?(Dotenv)

require_relative "config/application"
require_relative "config/environment"
require_relative "config/routes"
