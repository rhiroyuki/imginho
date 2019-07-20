# frozen_string_literal: true

class Routes < Roda
  route do |r|
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

  plugin :not_found do
    response.status = 404

    "Error #{response.status}: #{Rack::Utils::HTTP_STATUS_CODES[response.status]}"
  end
end
