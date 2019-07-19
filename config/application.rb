# frozen_string_literal: true

module Application
  class Project
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
        files = Dir.glob("environments/**/*.rb", base: __dir__)
        environments = files.map { |file| File.basename(file, ".*") }

        return ["none"] unless environments.size > 0

        environments
      end
    end
  end
end
