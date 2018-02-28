defmodule JradNet.LayoutView do
  use JradNet.Web, :view

  def current_user(conn) do
    conn
    |> Plug.Conn.get_session(:current_user)
  end
end
