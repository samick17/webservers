defmodule ElixirServer.Application do

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: ElixirServer.PubSub},
      ElixirServerWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ElixirServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    ElixirServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
