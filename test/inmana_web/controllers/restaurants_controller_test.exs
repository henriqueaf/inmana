defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the restaurant", %{conn: conn} do
      params = params_for(:restaurant)

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "Restaurant created!",
        "restaurant" => %{
          "email" => "siri@cascudo.com",
          "id" => _id,
          "name" => "Siri Cascudo"
        }
      } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{params_for(:restaurant) | email: "siricascudocom", name: ""}
      expected_response = %{"message" => %{"email" => ["has invalid format"], "name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert expected_response == response
    end
  end
end
