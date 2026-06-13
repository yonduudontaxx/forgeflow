defmodule Forgeflow.Repo do
  use Ecto.Repo,
    otp_app: :forgeflow,
    adapter: Ecto.Adapters.Postgres
end
