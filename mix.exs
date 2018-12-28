defmodule FeedProducts.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :feed_products,
      version:         "0.1.0",
      name:            "FeedProducts",
      source_url:      "https://github.com/fjfdepedro/feed_products",
      elixir:          "~> 1.5",
      escript:         escript_config(),
      start_permanent: Mix.env == :prod,
      deps:            deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  # add script to command line run
  defp escript_config do
    [ main_module: FeedProducts.CLI ]
  end
end
