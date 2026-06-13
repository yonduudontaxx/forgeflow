import Config

config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :forgeflow, ecto_repos: [Forgeflow.Repo]

import_config "#{config_env()}.exs"
