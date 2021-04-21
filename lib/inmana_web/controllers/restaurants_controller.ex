defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller
  import Inmana, only: [create_restaurant: 1]

  alias Inmana.Restaurant

  action_fallback InmanaWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
