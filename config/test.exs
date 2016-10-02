use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :peepchat, Peepchat.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :peepchat, Peepchat.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "peepchat_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Peepchat",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "anUGVvUoojuVxuFdfnNVnnDNSREYIqgU5ngAre3NU1yTGEOYIniQPJ+JlyA4qfP5",
  serializer: Peepchat.GuardianSerializer
