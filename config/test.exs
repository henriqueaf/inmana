use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :inmana, Inmana.Repo,
  username: "postgres",
  password: "postgres",
  database: "inmana_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "172.17.0.2",
  pool: Ecto.Adapters.SQL.Sandbox

if System.get_env("GITHUB_ACTIONS") do
  config :inmana, Inmana.Repo,
    username: "postgres",
    password: "postgres",
    database: "inmana_test",
    hostname: "localhost"
end

config :inmana, Inmana.Mailer, adapter: Bamboo.TestAdapter

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :inmana, InmanaWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
