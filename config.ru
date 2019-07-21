# frozen_string_literal: true

require_relative "boot"

NewRelic::Agent.manual_start if defined?(NewRelic)

run Application::Web.routes.freeze.app
