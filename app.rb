# frozen_string_literal: true

require "bundler/setup"

Bundler.require(:default, ENV["APP_ENV"] || :development)

class App < Roda
  route do |r|
    r.root do
      "Hello World"
    end
  end
end
