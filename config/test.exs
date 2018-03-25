use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :jrad_net, JradNet.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :jrad_net, JradNet.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "jrad_net_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# reduce number of encryption rounds ONLY IN TESTS
config :bcrypt_elixir, log_rounds: 4
