defmodule Yafia.MixProject do
  use Mix.Project

  def project do
    [
      app: :yafia,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      escript: [main_module: Yafia],
      deps: deps(),
      elixirc_paths: ["lib", "assets", "games"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Yafia, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:vix, "~> 0.26.0"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      # {:image, "~> 0.43"},
      {:mogrify, "~> 0.9.3"}
    ]
  end
end
