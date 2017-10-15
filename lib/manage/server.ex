defmodule Manage.Server do
  # alias Module.Restaurant

  use GenServer

  def start_link(restaurant_name) do
    GenServer.start_link(__MODULE__, restaurant_name)
  end

  def init(restaurant_name) do
    { :ok, Restaurant.new(restaurant_name) }
  end
end
