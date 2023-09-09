defmodule ExHtmx.Controllers.ToggleTodoDone do
  import Plug.Conn

  alias ExHtmx.Repos

  def call(%Plug.Conn{params: %{"id" => id}} = conn) do
    todo = Repos.Repo.get(Repos.Todo, String.to_integer(id))

    todo
    |> Ecto.Changeset.change(done: !todo.done)
    |> Repos.Repo.update()

    send_resp(conn, 204, "")
  end
end
