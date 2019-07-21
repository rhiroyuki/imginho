# frozen_string_literal: true

module Application
  class << self
    def env
      raise "Invalid environment: #{ENV["APP_ENV"]}. Valids are {#{valid_envs.join(", ")}}." unless env_valid?

      @env ||= ENV.fetch("APP_ENV").to_sym || :development
    end

    private

    def env_valid?
      File.exist?("config/environments/#{ENV.fetch("APP_ENV")}.rb")
    end

    def valid_envs
      return ["none"] unless envs.size > 0

      envs
    end
  end

  class Routes < Roda
    opts[:root] = "app"

    plugin :class_level_routing
    plugin :empty_root
    plugin :slash_path_empty

    plugin :render, engine: "html.erb", layout: :application_layout

    plugin :assets, css: "application.scss.erb", js: "application.js.erb", public: "../public"
    compile_assets if Application.env == :production

    plugin :error_handler do |error|
      if Application.production?
        "Something went wrong"
      else
        "OH NO: #{error}"
      end
    end

    plugin :not_found do
      response.status = 404

      "Error #{response.status}: #{Rack::Utils::HTTP_STATUS_CODES[response.status]}"
    end
  end
end
