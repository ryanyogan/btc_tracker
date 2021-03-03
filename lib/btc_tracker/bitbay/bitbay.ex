defmodule BtcTracker.Bitbay do
  alias BtcTracker.Bitbay.Clients.Http
  alias BtcTracker.Bitbay.Ticker

  alias BtcTracker.Repo

  import Ecto.Query

  def add_ticker do
    rate = Http.get_rate()

    Http.get_ticker()
    |> Map.put("rate", rate)
    |> Ticker.changeset()
    |> Repo.insert()
  end

  def tickers(limit \\ 20) do
    Ticker
    |> order_by(desc: :updated_at)
    |> limit(^limit)
    |> Repo.all()
  end
end
