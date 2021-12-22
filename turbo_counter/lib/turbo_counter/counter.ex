defmodule TurboCounter.Counters do

  def new do
    %{}
  end

  def add_counter(counters, name, value) do
    Map.put(counters, name, value)
  end

  def inc(counters, name) do
    Map.put(counters, name, counters[name] + 1)
  end

  def dec(counters, name) do
    Map.put(counters, name, counters[name] - 1)
  end

#  def remove_counter(counters, key) do
#    Map.
#  end

end
