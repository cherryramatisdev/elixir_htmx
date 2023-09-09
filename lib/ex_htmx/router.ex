defmodule ExHtmx.Router do
  alias ExHtmx.Controllers

  # Bring Plug.Router module into scope
  use Plug.Router

  # Attach the Logger to log incoming requests 
  plug(Plug.Logger)

  # Tell Plug to match the incoming request with the defined endpoints
  plug(:match)

  # Dispatch the connection to the matched handler
  plug(:dispatch)

  plug(Plug.Parsers, parsers: [:urlencoded, :multipart])

  get "/" do
    conn
    |> put_resp_content_type("text/html")
    |> Controllers.ListTodos.call()
  end

  post "/todo" do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    body = URI.decode_query(body)

    conn
    |> put_resp_content_type("text/html")
    |> Controllers.CreateTodo.call(body)
  end

  post "/todo/toggle/:id" do
    conn
    |> put_resp_content_type("text/html")
    |> Controllers.ToggleTodoDone.call()
  end

  # Fallback handler when there was no match
  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
