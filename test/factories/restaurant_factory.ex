defmodule Inmana.RestaurantFactory do
  defmacro __using__(_opts) do
    quote do
      def restaurant_factory do
        %Inmana.Restaurant{
          name: "Siri Cascudo",
          email: "siri@cascudo.com",
        }
      end
    end
  end
end
