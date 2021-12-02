defmodule PortAuthority.DynamicSupervisor do
  @moduledoc """
  handles and manages routing for multiple ports at once.
  """
  alias PortAuthority.Server
  use DynamicSupervisor


  def start_link(opts) do
    DynamicSupervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end


  @impl true
  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one, extra_arguments: [])
  end

  def start_child(init_args) do
    DynamicSupervisor.start_child(__MODULE__, %{id: Server, start: {Server, :start_link, [init_args]}})
  end


  def terminate_child(port) when is_pid(port) do
    DynamicSupervisor.terminate_child(__MODULE__, port)
  end

  def terminate_child(id) when is_binary(id) do

  end
end
