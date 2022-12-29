defmodule WebhookProcessor.MixProject do
  use Mix.Project

  def project do
    [
      app: :webhook_processor,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [ # add releases configuration
        prod: [ # we can name releases anything, this will be prod's config
          include_executables_for: [:unix], # we'll be deploying to Linux only
          steps: [:assemble, :tar] # have Mix automatically create a tarball after assembly
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {WebhookProcessor.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"}, # This will pull in Plug AND Cowboy
      {:poison, "~> 3.1"} # Latest version as of this writing
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
