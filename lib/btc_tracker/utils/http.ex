defmodule BtcTracker.Utils.Http do
  @timeout 5_000
  @callback get(String.t()) :: term() | no_return() | {:error, term()}

  @spec get(binary) :: any
  def get(url) do
    case HTTPoison.get(url, [{"content-type", "application/json"}], recv_timeout: @timeout) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        Jason.decode!(body)

      {:ok, %HTTPoison.Response{body: body}} ->
        {:error, body}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  @spec new :: any
  def new do
    Application.get_env(:btc_tracker, :http_client)
  end
end
