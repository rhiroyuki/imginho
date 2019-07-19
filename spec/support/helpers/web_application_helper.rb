# frozen_string_literal: true

module WebApplicationHelper
  include Rack::Test::Methods

  def app
    Routes
  end
end
