# frozen_string_literal: true

Dir.glob("lib/tasks/**/*.rake").each { |r| require_relative r }

namespace :assets do
  desc "Precompile the assets"
  task :precompile do
    require_relative "boot"

    Routes.compile_assets
  end
end

namespace :generate do
  desc "Create migration"
  task :migration, [:migration_name] do |t, args|
    require_relative "boot"

    raise "Migration name needed. Run $ rake generate:migration[migration_name]" if args[:migration_name].nil?

    timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
    filename = [args[:migration_name].downcase, "rb"].join(".")

    filepath = [timestamp, filename].join("_")

    camelized_migration_name = args[:migration_name].split("_").collect(&:capitalize).join

    File.open("db/migrate/#{filepath}", "w+") { |f| f.write("class #{camelized_migration_name}Migration < Sequel::Migration\nend") }
    puts "Migration file created: db/migrate/#{filepath}"
  end
end

namespace :db do
  desc "Migrate database"
  task :migrate do
    system("bin/migrate_db") || abort("\n== Command bin/migrate_db failed ==")
  end

  desc "Drop database"
  task :drop do
    require_relative "boot"
    require "yaml"

    config = YAML.safe_load(ERB.new(File.read("config/database.yml")).result)

    DB.disconnect
    Sequel.connect(config[Application.env.to_s].merge("database" => "postgres")) do |db|
      db.execute("DROP DATABASE #{config[Application.env.to_s]["database"]}")
    end

    puts "Database #{config[Application.env.to_s]["database"]} dropped"
  end

  desc "Create database"
  task :create do
    system("bin/create_db") || abort("\n== Command bin/create_db failed ==")
  end
end
