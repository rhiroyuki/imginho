# frozen_string_literal: true

class HelloWorldController < Roda
  route do |r|
    r.root do
      response.status = 201
      response.write("HelloWorld")

      response.finish
    end
  end
end
