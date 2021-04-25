defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true
  import Inmana.Factory

  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = params_for(:restaurant)

      result = Restaurant.changeset(params)

      assert %Ecto.Changeset{
        changes: ^params,
        valid?: true
      } = result
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{params_for(:restaurant) | name: "S", email: "siricascudocom"}
      expected_result = %{name: ["should be at least 2 character(s)"], email: ["has invalid format"]}

      result = Restaurant.changeset(params)

      assert %Ecto.Changeset{
        changes: ^params,
        valid?: false
      } = result

      assert errors_on(result) == expected_result
    end
  end
end
