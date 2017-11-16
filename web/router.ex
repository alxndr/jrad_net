defmodule JradNet.Router do
  use JradNet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", JradNet do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/shows", ShowController
    resources "/songs", SongController
    resources "/venues", VenueController
  end
end
