# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graphql_blog_api,
  ecto_repos: [GraphqlBlogApi.Repo]

# Configures the endpoint
config :graphql_blog_api, GraphqlBlogApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6dJrdKTQaH45qKnpin2U/tmIaYDWUB34lD5Ks0J44KGztTaAaRewz9PwoDGyOIoz",
  render_errors: [view: GraphqlBlogApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GraphqlBlogApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
