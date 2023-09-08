defmodule ExHtmx.Repos.Todo do
  use Ecto.Schema

  schema "todos" do
    field :title, :string
    field :description, :string
    field :done, :boolean

    timestamps()
  end
end
