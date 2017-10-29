use Mix.Config

# For production, we configure the host to read the PORT
# from the system environment. Therefore, you will need
# to set PORT=80 before running your server.
#
# You should also configure the url host to something
# meaningful, we use this information when generating URLs.
#
# Finally, we also include the path to a manifest
# containing the digested version of static files. This
# manifest is generated by the mix phoenix.digest task
# which you typically run after static files are built.
config :jrad_net, JradNet.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json"

# Do not print debug messages in production
config :logger, level: :info

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :jrad_net, JradNet.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [port: 443,
#               keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#               certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
#
#     config :jrad_net, JradNet.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :jrad_net, JradNet.Endpoint, server: true
#
config :jrad_net, JradNet.Endpoint,
  server: true,
  secret_key_base: "${SECRET_KEY_BASE}"

# Configure your database
config :jrad_net, JradNet.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATABASE_URL"},

  # This is a huge hack. When DATABASE_URL is empty, postgrex crashes when it can not find :database here.
  # This results in an infinite loop as postgrex gets restarted. This line stops it from crashing and instead
  # allows it to fail connection attempts at a reasonable rate. When DATABASE_URL is present, this line is
  # not used.
  database: "",
  pool_size: 1

config :libcluster,
  topologies: [
    k8s_example: [
      strategy: Cluster.Strategy.Kubernetes,
      config: [
        # It would be nicer if this was {:system, "LIBCLUSTER_KUBERNETES_SELECTOR"} like the above
        # but libcluster doesn't currently (1/10/17) support that and is just a convention that
        # not all libraries support.
        #
        # We have two options:
        # 1. Use System.get_env
        #    We know the selector at build time and we don't need to change it at 
        #    run time so System.get_env is sufficient for now.
        # 2. Use REPLACE_OS_VARS
        #    The config in this file gets turned into an erlang sys.config file.
        #    Distillery's boot.eex will replace os vars in sys.config if 
        #    REPLACE_OS_VARS=true. This method only works with strings so it will
        #    fail if the config requires an integer.
        #
        # We chose option 2 because setting up env vars at compile time is not strictly
        # necessary and avoiding it reduces complexity. We need runtime env vars anyway and
        # this is the more standard way of doing it. See 
        # http://sgeos.github.io/phoenix/elixir/erlang/ecto/exrm/postgresql/mysql/2016/09/11/storing-elixir-release-configuration-in-environment-variables.html
        kubernetes_selector: "${LIBCLUSTER_KUBERNETES_SELECTOR}",
        kubernetes_node_basename: "${LIBCLUSTER_KUBERNETES_NODE_BASENAME}"]]]
