defmodule BtcTracker.Repo do
  use Ecto.Repo,
    otp_app: :btc_tracker,
    adapter: Ecto.Adapters.Postgres
end
