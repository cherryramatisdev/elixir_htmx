defmodule ExHtmx.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_htmx,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExHtmx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.6"},
      {:ecto, "~> 3.10"},
      {:ecto_sqlite3, "~> 0.11"}
    ]
  end
end
