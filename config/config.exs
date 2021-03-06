# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :helpthisngo,
  ecto_repos: [Helpthisngo.Repo]

# Configures the endpoint
config :helpthisngo, Helpthisngo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nLLhOKa4xFZ7RoWLn1G6o9dyzjiXdLMW9yheLSxocS1e7VZW7Q7thprlB4mefCWP",
  render_errors: [view: Helpthisngo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Helpthisngo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Helpthisngo.User,
  repo: Helpthisngo.Repo,
  module: Helpthisngo,
  router: Helpthisngo.Router,
  messages_backend: Helpthisngo.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Help This Ngo Team",
  email_from_email: "contact@helpthisngo.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, Helpthisngo.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
