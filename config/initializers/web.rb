# frozen_string_literal: true

require "forwardable"

module Application
  class Web
    class << self
      extend Forwardable

      attr_accessor :routes

      def_delegator :@routes, :app, :app
    end
  end
end
