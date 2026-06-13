import Config

config :logger, level: :warning

config :forgeflow, Forgeflow.Repo,
  url: "postgres://forgeflow:forgeflow_dev@localhost:5434/forgeflow_test",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
