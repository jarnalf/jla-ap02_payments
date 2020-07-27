defmodule SnitchPayments.Gateway.Sequra do
  @moduledoc """
  Module to expose utilities and functions for the payemnt
  gateway `Sequra`.
  """

  alias SnitchPayments.PaymentMethodCode
  alias SnitchPayments.Response.HostedPayment

  @behaviour SnitchPayments.Gateway
  @credentials [:secret_key, :publishable_key]

  @failure_status "failure"
  @success_status "success"

  @doc """
  Returns the preferences for the gateway, at present it is mainly the
  list of credentials.

  These `credentials` refer to one provided by a `sequra` to a seller on
  account creation.

  The credentials consist of
  - `secret key`
  - `publishable key`
  """
  @spec preferences() :: list
  def preferences do
    @credentials
  end

  @doc """
  Returns the `payment code` for the gateway.

  The given module implements functionality for
  paypal as `hosted payment`. The code is returned
  for the same.
  > See
   `SnitchPayments.PaymentMethodCodes`
  """
  @spec payment_code() :: String.t()
  def payment_code do
    PaymentMethodCode.hosted_payment()
  end

  @doc """
  Parses the `params` supplied and returns a
  `HostedPayment.t()` struct as response.
  """
  @spec parse_response(map) :: HostedPayment.t()
  def parse_response(params) do
    params = filter_sequra_params(params)
    Map.merge(%HostedPayment{}, params)
  end


  defp filter_sequra_params(params) do
    %{
      transaction_id: params["id"],
      payment_source: params["payment_source"],
      raw_response: params,
      status: @success_status,
      order_id: String.to_integer(params["order_id"]),
      payment_id: String.to_integer(params["payment_id"])
    }
  end
end
