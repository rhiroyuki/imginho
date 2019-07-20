# frozen_string_literal: true

require_relative "application_controller"

class AboutController < ApplicationController
  root do
    @name = "Abestado"

    view("about")
  end
end
