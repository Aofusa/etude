#! /bin/elixir

defmodule GameObject do
  defstruct name: "", hp: 0, atk: 0

  def attack() do
    :rand.uniform(atk)
  end
end
