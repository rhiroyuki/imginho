# frozen_string_literal: true

class Routes < Roda
  route do |r|
    r.root do
      r.run HelloWorldController
    end
  end
end
