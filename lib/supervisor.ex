defmodule Manage.Supervisor do
  use Supervisor

  @name __MODULE__

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: @name)
  end

  def init(_) do
    children = [
      worker(Manage.Server, [])
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
