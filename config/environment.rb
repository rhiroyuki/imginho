# frozen_string_literal: true

require_relative "environments/#{Application.env}"

module Application
  class << self
    Dir.glob("environments/**/*.rb", base: __dir__).map do |file|
      define_method :"#{File.basename(file, ".*")}?" do
        env == File.basename(file, ".*").to_sym
      end
    end
  end
end
