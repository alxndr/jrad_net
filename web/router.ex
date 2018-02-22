defmodule JradNet.Router do
  use JradNet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :prayer_flag
  end

  def prayer_flag(conn, _) do
    conn
    |> Plug.Conn.put_resp_header("flag", "ཨོཾ་མ་ཎི་པདྨེ་ཧཱུྂ༔")
  end

  scope "/", JradNet do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/shows", ShowController
    resources "/songs", SongController
    resources "/users", UserController # TODO admin-only
    resources "/venues", VenueController
  end
end
