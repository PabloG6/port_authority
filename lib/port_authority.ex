defmodule PortAuthority do
  alias PortAuthority
  require Logger
  use Application
  @moduledoc """
  Documentation for `PortAuthority`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PortAuthority.hello()
      :world

  """
  def init do

  end

  @doc """
  register a new port listener
  """
  def register do

  end


  def stop do

  end

  @impl true
  def start(_type, _args) do
    Logger.info("starting application")
    PortAuthority.DynamicSupervisor.start_link([])
  end



end
