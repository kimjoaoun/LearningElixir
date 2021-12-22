defmodule TurboCounter.Counters do

  def new do
    %{}
  end

  def add_counter(counters, name, value) do
    Map.put(counters, name, value)
  end

  def add_counter(counters) do
    Map.put(counters, max_counter_name(counters), 0)
  end

  defp max_counter_name(counters) do
    counters
    |> Map.keys
    |> Enum.map(&String.to_integer/1)
    |> Enum.max
    |> Kernel.+(1)
    |> to_string
  rescue
    _e -> "1"
  end

  def remove_counter(counters, name) do
    Map.delete(counters, name)
  end

  def inc(counters, name) do
    Map.put(counters, name, counters[name] + 1)
  end

  def dec(counters, name) do
    Map.put(counters, name, counters[name] - 1)
  end

  def clear(counters, name) do
    Map.put(counters, name, 0)
  end

end
