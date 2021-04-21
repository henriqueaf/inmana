defmodule InmanaWeb.SuppliesController do
  use InmanaWeb, :controller
  import Inmana, only: [create_supply: 1, get_supply: 1]

  alias Inmana.Supply

  action_fallback InmanaWeb.FallbackController

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end
end
