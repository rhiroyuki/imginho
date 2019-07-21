# frozen_string_literal: true

class AboutController < ApplicationController
  root do
    @name = "Abestado"

    view("about")
  end
end
