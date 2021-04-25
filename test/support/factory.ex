defmodule Inmana.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Inmana.Repo
  use Inmana.RestaurantFactory
end
