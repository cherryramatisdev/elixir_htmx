defmodule ExHtmx.Services.ListTodos do
  import Ecto.Query

  alias ExHtmx.Repos

  @spec call() :: list(Repos.Todo)
  def call do
    query = from(t in Repos.Todo, where: t.done == false, select: t)

    Repos.Repo.all(query)
  end
end
