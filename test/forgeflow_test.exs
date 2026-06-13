defmodule ForgeflowTest do
  use ExUnit.Case
  doctest Forgeflow

  test "greets the world" do
    assert Forgeflow.hello() == :world
  end
end
