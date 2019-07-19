# frozen_string_literal: true

class Routes < Roda
  route do |r|
    r.root do
      "Hello World"
    end
  end
end
