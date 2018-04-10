defmodule JradNet.Router do
  use JradNet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PlugPrayerFlag
  end

  scope "/", JradNet do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/performances", SongPerformanceController, only: [:edit, :update, :delete]
    resources "/shows", ShowController
    resources "/songs", SongController
    resources "/users", UserController # TODO admin-only
    resources "/venues", VenueController

    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end
end
