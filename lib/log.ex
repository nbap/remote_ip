defmodule RemoteIp.LoggerWrapper do
  @moduledoc """
  Entry point for parsing any type of forwarding header.
  """

  require Logger

  def log(function, params) do
    case Application.get_env(:remote_ip, :do_not_log, true) do
      true ->
        :ok

      _ ->
        Logger.debug(fn ->
          function.(params)
        end)
    end
  end
end
