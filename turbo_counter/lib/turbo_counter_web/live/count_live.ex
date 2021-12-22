defmodule TurboCounterWeb.CountLive do

  use TurboCounterWeb, :live_view
  alias TurboCounter.Counters

  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> new
      |> add_counter
      |> add_counter
    }
  end

  defp new(socket) do
    assign(socket, counters: Counters.new())
  end

  defp add_counter(socket) do
    assign(
      socket,
      counters: Counters.add_counter(socket.assigns.counters)
    )
  end

  defp count(socket, counter) do
    assign(socket, counters: Counters.inc(socket.assigns.counters, counter))
  end

  def render(assigns) do
    ~L"""
    <h1>Welcome to Turbo Counter</h1>
    <h2>If you dream it, we can count it. </h2>
    <hr>
    <%= for {name, count} <- @counters do %>
    <p>
      Counter<%= name %>: <%= count %>
      <button phx-click="inc" phx-value-counter="<%= name %>">Increment</button>
    </p>
    <% end %>
    """
  end

  def handle_event("inc", %{"counter" => counter}, socket) do
    {:noreply, count(socket, counter)}
  end

end
