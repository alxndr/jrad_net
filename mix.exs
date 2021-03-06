defmodule JradNet.Mixfile do
  use Mix.Project

  def project do
    [app: :jrad_net,
     version: "0.1.0-gamma",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {JradNet, []},
     applications: [
       :bcrypt_elixir,
       :comeonin,
       :cowboy,
       :gettext,
       :libcluster,
       :logger,
       :phoenix,
       :phoenix_ecto,
       :phoenix_html,
       :phoenix_pubsub,
       :plug_prayer_flag,
       :postgrex,
       :runtime_tools,
       :ssl,
       :timex,
     ]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:apex, "~> 1.1.0", only: :dev},
      {:arbor, "~> 1.0.5"},
      {:bcrypt_elixir, "~> 1.0"},
      {:comeonin, "~> 4.0"}, # n.b. the tutorial uses 2.3
      {:cowboy, "~> 1.0"},
      {:distillery, "~> 1.0.0"},
      {:gettext, "~> 0.11"},
      {:libcluster, "~> 2.0.3"},
      {:phoenix, "1.3.0"},
      {:phoenix_ecto, "~> 3.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_pubsub, "~> 1.0"},
      {:plug_prayer_flag, "~> 1.0"},
      {:postgrex, ">= 0.0.0"},
      {:timex, "~> 3.1"},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
