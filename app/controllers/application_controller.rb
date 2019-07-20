# frozen_string_literal: true

class ApplicationController < Roda
  opts[:root] = "app"

  plugin :class_level_routing
  plugin :common_logger, Application::Logger.logger
  plugin :empty_root
  plugin :slash_path_empty
  plugin :error_handler do |error|
    if Application.production?
      "Something went wrong"
    else
      "OH NO: #{error}"
    end
  end

  # rendering/view plugins
  plugin :render, engine: "html.erb", layout: :application_layout
  plugin :assets, css: "application.scss.erb", js: "application.js.erb", public: "../public"
  compile_assets if Application.production?
end
