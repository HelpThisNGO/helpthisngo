defmodule Helpthisngo.Router do
  use Helpthisngo.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Helpthisngo do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
  end

	scope "/", Helpthisngo do
	  pipe_through :protected
   # add protected resources below
	end

  # Other scopes may use custom stacks.
  # scope "/api", Helpthisngo do
  #   pipe_through :api
  # end
end
