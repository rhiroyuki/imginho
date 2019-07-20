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
end
