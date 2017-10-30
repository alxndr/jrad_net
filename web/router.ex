defmodule JradNet.Router do
  use JradNet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JradNet do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/shows", ShowController, only: [:index, :show]
    resources "/songs", SongController, only: [:index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", JradNet do
  #   pipe_through :api
  # end
end
