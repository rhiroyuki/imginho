# frozen_string_literal: true

class ApplicationController < Roda
  plugin :class_level_routing
  plugin :common_logger, Application::Logger.logger
end
