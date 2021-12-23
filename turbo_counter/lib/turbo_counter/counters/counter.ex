defmodule TurboCounter.Counters.Counter do
  defstruct [:name, value: 0]
  @types  %{name: :string, value: :integer}
  import Ecto.Changeset # Using import allows you to use a function directly without specifying library

  def new, do: %__MODULE__{}

  def new_changeset(params, counters) do
    {new(), @types}
    |> Ecto.Changeset.cast(params, Map.keys(@types))
    |> Ecto.Changeset.validate_required(:name)
    |> validate_exclusion(:name, Map.keys(counters), message: "can't be repeated")
  end

end
