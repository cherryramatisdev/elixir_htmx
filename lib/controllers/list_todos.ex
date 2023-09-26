defmodule ExHtmx.Controllers.ListTodos do
  import Plug.Conn
  import Ecto.Query

  alias ExHtmx.Repos
  alias ExHtmx.HTMLTemplate

  def call(conn) do
    todos = ExHtmx.Services.ListTodos.call()

    send_resp(conn, 200, HTMLTemplate.render_file("index.html.heex", todos: todos))
  end
end
