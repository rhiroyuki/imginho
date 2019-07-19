# frozen_string_literal: true

require "logger"

module Application
  module Logger
    class << self
      attr_writer :logger

      def log_info(message)
        logger.info(message)
      end

      def log_warn(message)
        logger.warn(message)
      end

      def log_debug(message)
        logger.debug(message)
      end

      def log_error(message)
        logger.error(message)
      end

      def logger
        return @logger if defined?(@logger)

        @logger ||= ::Logger.new(STDOUT, level: :info)
      end
    end
  end
end
