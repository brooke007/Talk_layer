defmodule TalkLayer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TalkLayerWeb.Telemetry,
      TalkLayer.Repo,
      {DNSCluster, query: Application.get_env(:talk_layer, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TalkLayer.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TalkLayer.Finch},
      # Start a worker by calling: TalkLayer.Worker.start_link(arg)
      # {TalkLayer.Worker, arg},
      # Start to serve requests, typically the last entry
      TalkLayerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TalkLayer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TalkLayerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
