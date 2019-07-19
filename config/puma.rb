# frozen_string_literal: true

unless ENV.fetch("APP_ENV", "development") == "production"
  require "dotenv/load"
end

workers Integer(ENV["WEB_CONCURRENCY"] || 2)
threads_count = Integer(ENV["MAX_THREADS"] || 4)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV["PORT"] || 3000
environment ENV["APP_ENV"] || "development"

# If you are preloading your application and using Active Record, it's
# recommended that you close any connections to the database before workers
# are forked to prevent connection leakage.
#
before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end

# The code in the `on_worker_boot` will be called if you are using
# clustered mode by specifying a number of `workers`. After each worker
# process is booted, this block will be run. If you are using the `preload_app!`
# option, you will want to use this block to reconnect to any threads
# or connections that may have been created at application boot, as Ruby
# cannot share connections between processes.
# More: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
#
# on_worker_boot do
#   config = YAML.safe_load(ERB.new(File.read("config/database.yml")).result)

#   ActiveRecord::Base.establish_connection(config[Application.environment.to_s])
# end
