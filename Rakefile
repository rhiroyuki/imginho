# frozen_string_literal: true

require_relative "boot"

Dir.glob("lib/tasks/**/*.rake").each { |r| require_relative r }

namespace :assets do
  desc "Precompile the assets"
  task :precompile do
    Routes.compile_assets
  end
end
