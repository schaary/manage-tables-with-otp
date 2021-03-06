defmodule Manage.Server do

  alias Manage.Restaurant

  use GenServer

  def start_link(restaurant_name) do
    GenServer.start_link(__MODULE__, restaurant_name)
  end

  def init(restaurant_name) do
    { :ok, Restaurant.new(restaurant_name) }
  end

  def handle_call({ :is_open }, _from, restaurant) do
    { :reply, Restaurant.is_open?(restaurant), restaurant }
  end

  def handle_cast({ :close! }, restaurant) do
    new_restaurant = Restaurant.close!(restaurant)

    { :noreply, new_restaurant }
  end

  def handle_call({ :status }, _from, restaurant) do
    { :reply , Restaurant.status(restaurant), restaurant }
  end
end
