import Config

config :logger, :default_formatter, format: "[$level] $message\n"

config :forgeflow, Forgeflow.Repo,
  url: "postgres://forgeflow:forgeflow_dev@localhost:5433/forgeflow_dev",
  pool_size: 10
