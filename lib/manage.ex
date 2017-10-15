defmodule Manage do

  def new(restaurant_name) do
    {:ok, pid} = Supervisor.start_child(Manage.Supervisor, [restaurant_name])
    pid
  end

  def is_open?(restaurant_pid) do
    GenServer.call(restaurant_pid, { :is_open? })
  end

  def close!(restaurant_pid) do
    GenServer.call(restaurant_pid, { :close! })
  end

  def crash(restaurant_pid) do
    GenServer.call(restaurant_pid, { :crash })
  end
end
