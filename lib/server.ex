defmodule PortAuthority.Server do
  use GenServer
  require Logger

  @moduledoc """
  responsible for listening and routing to the respective port

  """

  def init(args) do
    Logger.info("arguments #{inspect(args)}")
    port = Keyword.fetch!(args, :port)
    {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    {:ok, socket}
  end


  def start_link(init_args) do

    GenServer.start_link(__MODULE__, init_args)
  end


  def handle_call(:port, _state) do

  end
end
