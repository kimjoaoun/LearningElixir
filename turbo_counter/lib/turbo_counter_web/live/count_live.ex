defmodule TurboCounterWeb.CountLive do
  #use Phoenix.LiveView
  use TurboCounterWeb, :live_view
  alias TurboCounter.Counters


  def mount(_params, _session, socket) do
    :timer.send_interval 1000, self(), :tick

    {
      :ok,
      socket
      |> new
      |> add_calendar(:count, 0)
    }
  end

  defp new(socket) do
    assign(socket, counters: Counters.new())
  end

  defp add_calendar(socket, name, count) do
    assign(
      socket,
      counters: Counters.add_counter(socket.assigns.counters, name, count)
    )
  end

  def count(socket) do
    assign(socket, counters: Counters.inc(socket.assigns.counters, :count))
  end

  def render(assigns) do
    ~L"""
    <h1>Welcome to Turbo Counter</h1>
    <h2>If you dream it, we can count it. </h2>
    <p>Count: <%= @counters.count %> </p>
    """
  end

  def handle_info(:tick, socket) do
    {:noreply, count(socket)}
  end

end
