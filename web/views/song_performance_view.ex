defmodule JradNet.SongPerformanceView do
  use JradNet.Web, :view
  alias JradNet.{
    User,
  }

  def title(_, _), do: nil

  def user_can(user, action), do: User.can(user, nil, action, nil)
  def user_can(user, action, object), do: User.can(user, nil, action, object)
end
