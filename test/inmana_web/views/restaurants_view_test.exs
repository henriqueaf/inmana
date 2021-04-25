defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  alias InmanaWeb.RestaurantsView

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  describe "render/2" do
    test "renders create.json" do
      restaurant = insert(:restaurant)

      expected_response = %{
        message: "Restaurant created!",
        restaurant: restaurant
      }

      response = render(RestaurantsView, "create.json", %{restaurant: restaurant})

      assert expected_response == response
    end
  end
end
