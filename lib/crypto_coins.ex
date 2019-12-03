require CryptoCoins.Api
defmodule CryptoCoins do

  def coin(coins, name) when is_binary(name) do
    Enum.find(coins, fn coin -> Map.fetch!(coin, "name") == name end)
  end

  def most_valuable(coins) do
    Enum.max_by(coins, fn coin -> Float.parse(Map.fetch!(coin, "price"))end)
  end

  def most_capped(coins) do
    Enum.max_by(coins, fn coin -> Map.fetch!(coin, "marketCap")end)
  end

  def most_ranked(coins) do
    Enum.min_by(coins, fn coin -> Map.fetch!(coin, "rank")end)
  end

  def sort_by(coins, field) do
    Enum.sort_by(coins, fn coin -> Map.fetch!(coin, field) == field end)
  end
end
