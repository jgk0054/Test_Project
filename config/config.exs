# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :test_application,
  ecto_repos: [TestApplication.Repo]

# Configures the endpoint
config :test_application, TestApplicationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "n9SInJs/RB4uII+LyARnVuO6TXiaXksNMsBL5yopEswe9l2N0mqLFpFw/u68e8c+",
  render_errors: [view: TestApplicationWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TestApplication.PubSub,
  live_view: [signing_salt: "l9Dcz/fB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
