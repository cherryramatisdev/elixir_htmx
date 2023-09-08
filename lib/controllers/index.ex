defmodule ExHtmx.Controllers.Index do
  import Plug.Conn

  alias ExHtmx.Repos
  alias ExHtmx.HTMLTemplate

  def call(conn) do
    todos = Repos.Repo.all(Repos.Todo)
    send_resp(conn, 200, HTMLTemplate.render("index.html.eex", [todos: todos]))
  end
end
