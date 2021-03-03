defmodule BtcTracker.Bitbay.Clients.Http do
  alias BtcTracker.Utils.Http

  def get_ticker do
    Http.new().get("https://bitbay.net/API/Public/BTCPLN/ticker.json")
  end

  def get_rate do
    rate = Http.new().get("http://api.nbp.pl/api/exchangerates/rates/a/usd/?format=json")

    rate
    |> Map.get("rates")
    |> Enum.at(0)
    |> Map.get("mid")
  end
end
