# JradNet

## dev setup

```shell
$ mix deps.get

# get postgres set running...

$ mix do ecto.create, ecto.migrate
$ mix run priv/repo/seeds.exs
```

Run seeds on Gigalixir...

```
$ gigalixir remote_console $APP_NAME
$> Path.join([:code.priv_dir(:jrad_net), "repo", "seeds.exs"]) |> Code.eval_file
```


-------

Git v2.9.0 required to support extra headers.

Hot Upgrade:

    git -c http.extraheader="GIGALIXIR-HOT: true" push gigalixir master

Clean cache before building:

    git -c http.extraheader="GIGALIXIR-CLEAN: true" push gigalixir master

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`
