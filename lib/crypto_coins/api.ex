defmodule CryptoCoins.Api do
  # Check Tesla Docs
  # API Base is: "https://api.coinranking.com/v1/public"
  # Endpoint is: /coins

    use Tesla

    plug Tesla.Middleware.BaseUrl, "https://api.coinranking.com/v1/public"
    plug Tesla.Middleware.Headers, [{"", ""}]
    plug Tesla.Middleware.JSON



  # returns {:ok, array_of_coins}
  def coins() do
    {:ok, response} = get("/coins")
    coins = response |> Map.fetch!(:body) |> Map.fetch!("data") |> Map.fetch!("coins")
  end

  # returns array_of_coins
  #raise if error
  def coins!() do
    {:ok, response} = get("/coins")

    if(response.status in 200..299) do
      coins = response |> Map.fetch!(:body) |> Map.fetch!("data") |> Map.fetch!("coins")
    else
      raise "Adios!"
    end
  end
end
