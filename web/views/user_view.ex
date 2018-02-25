defmodule JradNet.UserView do
  use JradNet.Web, :view

  def title("index.html", _), do: "Users"
  def title("new.html", _), do: "Create a new user"
  def title("edit.html", %{conn: %{assigns: %{user: _user}}}), do: "Edit user"
  def title("show.html", %{conn: %{assigns: %{user: user}}}), do: "Viewing user: #{user.email}"
end
