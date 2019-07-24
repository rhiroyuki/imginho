# frozen_string_literal: true

class Routes < Application::Routes
  plugin :common_logger, ::Application::Logger.logger

  route do |r|
    r.assets

    r.get ["", true] do
      @photo = Photo.new
      view "homepage"
    end

    r.post "upload" do
      Photo.create(r.params.slice("image", "description"))
      "oi"
    end

    r.is "about" do
      r.run ::AboutController
    end
  end
end

Application::Web.routes = Routes.freeze
