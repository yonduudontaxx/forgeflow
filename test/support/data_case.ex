defmodule Forgeflow.DataCase do
  @moduledoc false

  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      alias Forgeflow.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Forgeflow.DataCase
    end
  end

  setup tags do
    Forgeflow.DataCase.setup_sandbox(tags)
  end

  def setup_sandbox(tags) do
    pid = Sandbox.start_owner!(Forgeflow.Repo, shared: not tags[:async])

    on_exit(fn -> Sandbox.stop_owner(pid) end)

    :ok
  end
end
