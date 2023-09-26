defmodule ExHtmx.Controllers.ToggleTodoDone do
  import Plug.Conn

  alias ExHtmx.Repos
  alias ExHtmx.HTMLTemplate
  alias ExHtmx.Services

  def call(%Plug.Conn{params: %{"id" => id}} = conn) do
    todo = Repos.Repo.get(Repos.Todo, String.to_integer(id))

    todo
    |> Ecto.Changeset.change(done: !todo.done)
    |> Repos.Repo.update()

    todos = Services.ListTodos.call()

    response = """
    <div id="todo_list">
      <%= for item <- @todos do %>
        <%= ExHtmx.HTMLTemplate.render_file("_todo_item.html.heex", item: item) %>
      <% end %>
    </div>
    """

    send_resp(
      conn,
      200,
      HTMLTemplate.render_string(response, todos: todos)
    )
  end
end
