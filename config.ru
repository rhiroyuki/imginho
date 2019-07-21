# frozen_string_literal: true

require_relative "boot"

NewRelic::Agent.manual_start if defined?(NewRelic)

if Application.production?
  require "librato-rack"
  use Librato::Rack
end

run Application::Web.routes.freeze.app
