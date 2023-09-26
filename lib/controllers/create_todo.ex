defmodule ExHtmx.Controllers.CreateTodo do
  import Plug.Conn

  alias ExHtmx.Repos
  alias ExHtmx.HTMLTemplate

  def call(conn, %{"todo_name" => todo_name, "todo_description" => todo_description}) do
    {:ok, todo} =
      %Repos.Todo{
        title: todo_name,
        description: todo_description,
        done: false
      }
      |> Repos.Repo.insert()

    send_resp(conn, 200, HTMLTemplate.render_file("_todo_item.html.heex", item: todo))
  end
end
