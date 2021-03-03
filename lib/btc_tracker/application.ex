defmodule BtcTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BtcTracker.Repo,
      # Start the Telemetry supervisor
      BtcTrackerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BtcTracker.PubSub},
      # Start the Endpoint (http/https)
      BtcTrackerWeb.Endpoint
      # Start a worker by calling: BtcTracker.Worker.start_link(arg)
      # {BtcTracker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BtcTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BtcTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
