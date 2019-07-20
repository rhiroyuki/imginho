# frozen_string_literal: true

require_relative "boot"

run Application::Web.routes.freeze.app
