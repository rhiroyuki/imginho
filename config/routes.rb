# frozen_string_literal: true

class Routes < Application::Routes
  plugin :common_logger, ::Application::Logger.logger

  route do |r|
    r.assets

    r.get ["", true] do
      view "homepage"
    end

    r.post "upload" do
      # r.run ::FileUploadsController
      binding.pry
    end

    r.is "about" do
      r.run ::AboutController
    end
  end
end

Application::Web.routes = Routes.freeze
