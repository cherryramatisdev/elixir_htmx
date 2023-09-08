import Config

config :ex_htmx, ecto_repos: [ExHtmx.Repos.Repo]

config :ex_htmx, ExHtmx.Repos.Repo,
  database: "database.db"
