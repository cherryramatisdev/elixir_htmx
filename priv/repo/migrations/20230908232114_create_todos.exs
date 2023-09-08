defmodule ExHtmx.Repos.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table("todos") do
      add :title, :string
      add :description, :string
      add :done, :boolean

      timestamps()
    end
  end
end
