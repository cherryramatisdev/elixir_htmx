defmodule ExHtmx.Controllers.CreateTodo do
  import Plug.Conn

  alias ExHtmx.Repos
  alias ExHtmx.HTMLTemplate

  def call(conn, %{"todo_name" => todo_name, "todo_description" => todo_description}) do
    response = """
      <div class="p-2 mb-2 card">
        <div>
          <input type="checkbox">
          <b><%= @todo.title %></b>
        </div>

        <p class="mb-0"><%= @todo.description %></p>
      </div>
    """

    {:ok, todo} = %Repos.Todo{
      title: todo_name,
      description: todo_description,
      done: false,
    } |> Repos.Repo.insert()

    send_resp(conn, 200, HTMLTemplate.render_string(response, [todo: todo]))
  end
end
