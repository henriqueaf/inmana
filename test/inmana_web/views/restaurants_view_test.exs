defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Siri Cascudo", email: "siri@cascudo.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", %{restaurant: restaurant})

      assert %{
        message: "Restaurant created!",
        restaurant: %Restaurant{
          id: _id,
          name: "Siri Cascudo",
          email: "siri@cascudo.com"
        }
      } = response
    end
  end
end
