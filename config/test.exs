import Config

config :logger, level: :warning

config :forgeflow, Forgeflow.Repo,
  url: "postgres://forgeflow:forgeflow_dev@localhost:5434/forgeflow_test",
  pool_size: 1,
  pool: Ecto.Adapters.SQL.Sandbox
