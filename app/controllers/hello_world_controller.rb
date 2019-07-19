# frozen_string_literal: true

require_relative "application_controller"

class HelloWorldController < ApplicationController
  root do
    response.status = 201
    response.write("HelloWorld")

    response.finish
  end
end
