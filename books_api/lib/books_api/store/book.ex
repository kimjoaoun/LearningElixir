defmodule BooksApi.Store.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "books" do
    field :authors, {:array, :string}
    field :description, :string
    field :isbn, :string
    field :price, :float
    field :tite, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:tite, :isbn, :description, :price, :authors])
    |> validate_required([:tite, :isbn, :description, :price, :authors])
    |> unique_constraint(:isbn)
  end
end
