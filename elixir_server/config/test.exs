import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_server, ElixirServerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "lsLM2Umo9JA1hiyVCsgomgsaKOO8egBUum4+l/5CExAfUqu32V64P3V/Lb3CYCy3",
  server: false

# In test we don't send emails.
config :elixir_server, ElixirServer.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
