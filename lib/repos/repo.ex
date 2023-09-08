defmodule ExHtmx.Repos.Repo do
  use Ecto.Repo, otp_app: :ex_htmx, adapter: Ecto.Adapters.SQLite3
end
