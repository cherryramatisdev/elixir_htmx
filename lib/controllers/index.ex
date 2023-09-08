defmodule ExHtmx.Controllers.Index do
  import Plug.Conn

  alias ExHtmx.HTMLTemplate

  def call(conn) do
    send_resp(conn, 200, HTMLTemplate.render("index.html.eex"))
  end
end
