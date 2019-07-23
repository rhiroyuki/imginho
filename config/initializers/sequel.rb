# frozen_string_literal: true

require "yaml"
require "logger"

Sequel.extension :migration, :core_extensions

config = YAML.safe_load(ERB.new(File.read("config/database.yml")).result)

begin
  DB = Sequel.connect(config[Application.env.to_s], logger: Logger.new($stderr))
# rescue => PG::InvalidCatalogName
  # Sequel.connect(config[Application.env.to_s].merge("database" => "postgres")) do |db|
  #   db.execute("CREATE DATABASE #{config[Application.env.to_s]['database']}")
  # end

  # DB = Sequel.connect(config[Application.env.to_s])
end

Sequel::Migrator.check_current(DB, 'db/migrate')
