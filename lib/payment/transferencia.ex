defmodule SnitchPayments.Payment.Transferencia do
  @moduledoc """
  Module to expose utilities and functions for the payemnt
  type `transferencia`.
  """
  alias SnitchPayments.PaymentMethodCode

  @preferences [:cod_fee]

  @doc """
  Returns a list of preferences for this payment type.

  At present returns only the "fee" to be charged for `cod`.
  """
  @spec preferences() :: list
  def preferences do
    @preferences
  end

  @doc """
  Returns the `payment code`
  """
  @spec payment_code() :: String.t()
  def payment_code do
    PaymentMethodCode.transferencia()
  end
end
