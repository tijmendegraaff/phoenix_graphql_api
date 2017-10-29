# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_graphql_api,
  ecto_repos: [PhoenixGraphqlApi.Repo]

# Configures the endpoint
config :phoenix_graphql_api, PhoenixGraphqlApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pLIYSCLGIIXHIIV4D1UNOIPsQm47bo94A/sxcgDLlOyq9Gey6F76vsS51H+P41AU",
  render_errors: [view: PhoenixGraphqlApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixGraphqlApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
