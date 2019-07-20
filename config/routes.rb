# frozen_string_literal: true

class Routes < Roda
  opts[:root] = "app"

  route do |r|
    r.assets

    r.get ["", true] do
      r.run HelloWorldController
    end

    r.is "world" do
      "world"
    end

    r.is "about" do
      r.run AboutController
    end
  end

  plugin :assets, css: "application.scss.erb", js: "application.js.erb", public: "../public"
  compile_assets if Application.production?
  plugin :not_found do
    response.status = 404

    "Error #{response.status}: #{Rack::Utils::HTTP_STATUS_CODES[response.status]}"
  end
end
