defmodule Manage.Restaurant do

  defstruct name: "", status: "open"

  def new(restaurant_name) do
    %Manage.Restaurant{
      name: restaurant_name
    }
  end

  def is_open?(%Manage.Restaurant{ status: "open" }), do: true
  def is_open?(%Manage.Restaurant{} = _not_open_restaurant), do: false

  def close!(%Manage.Restaurant{} = restaurant) do 
    %{ restaurant | status: "closed" }
  end

end
