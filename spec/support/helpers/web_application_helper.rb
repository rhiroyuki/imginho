# frozen_string_literal: true

module WebApplicationHelper
  include Rack::Test::Methods

  def app
    Application::Web.routes.freeze.app
  end
end
