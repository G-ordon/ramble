defmodule Ramble.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RambleWeb.Telemetry,
      Ramble.Repo,
      {DNSCluster, query: Application.get_env(:ramble, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Ramble.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Ramble.Finch},
      # Start a worker by calling: Ramble.Worker.start_link(arg)
      # {Ramble.Worker, arg},
      # Start to serve requests, typically the last entry
      RambleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ramble.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RambleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
