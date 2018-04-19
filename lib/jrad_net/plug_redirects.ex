defmodule JradNet.PlugRedirects do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _options) do
    if canonical_domain?(conn.host) do
      conn
    else
      conn
      |> put_status(:moved_permanently)
      |> Phoenix.Controller.redirect(external: canonical_domain() <> conn.request_path)
      |> halt()
    end
  end

  defp canonical_domain do
    "#{canonical_scheme()}://#{canonical_host()}"
  end

  defp canonical_host do
    JradNet.Endpoint.config(:url)[:host]
  end

  defp canonical_scheme do
    JradNet.Endpoint.config(:url)[:scheme]
  end

  defp canonical_domain?(host) do
    host === "almost-dead.net"
  end

end
