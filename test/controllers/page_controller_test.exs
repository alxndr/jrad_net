defmodule JradNet.PageControllerTest do
  use JradNet.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!" # TODO ...
  end
end
