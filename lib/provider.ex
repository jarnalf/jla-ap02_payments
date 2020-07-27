defmodule SnitchPayments.Provider do
  @moduledoc """
  Utilities for handling source(gateway) and the related
  modules to handle related functionalities.
  """

  @doc """
  Returns the source type for the supplied gateway :atom.

  The provider types helps in idenitfying the module to
  handle tasks such as response parsing for the particular
  source.
  """
  @spec provider(atom) :: String.t()
  def provider(gateway) do
    case gateway do
      :paypal -> "paypal"
      :stripe -> "stripe"
      :stripev2 -> "stripev2"
      :sequra -> "sequra"
    end
  end

  def module("paypal") do
    Elixir.SnitchPayments.Gateway.PayPal
  end

  def module("stripe") do
    Elixir.SnitchPayments.Gateway.Stripe
  end

  def module("stripev2") do
    Elixir.SnitchPayments.Gateway.Stripev2
  end

  def module("sequra") do
    Elixir.SnitchPayments.Gateway.Sequra
  end

end
