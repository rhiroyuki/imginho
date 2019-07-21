# frozen_string_literal: true

class HelloWorldController < ApplicationController
  root do
    response.status = 201
    response.write("HelloWorld")

    response.finish
  end
end
