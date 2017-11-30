# JradNet

## dev setup

```shell
$ mix deps.get

# get postgres set running...

$ mix do ecto.create, ecto.migrate
$ mix run priv/repo/seeds.exs
```

## Gigalixir

Set up (free) DB:

```
$ gigalixir create_free_database $APP_NAME
$ gigalixir scale $APP_NAME --replicas=1 # ?
$ gigalixir migrate $APP_NAME
```

Run seeds:

```
$ gigalixir remote_console $APP_NAME
$> Path.join([:code.priv_dir(:jrad_net), "repo", "seeds.exs"]) |> Code.eval_file
```

Delete (free) DB:

```
$ gigalixir scale $APP_NAME --replicas=0
$ export GX_FREEDB_ID=$(gigalixir free_databases $APP_NAME | jq '.[] | select(.state=="AVAILABLE") | .id' | sed -e 's/"//g')
$ gigalixir delete_free_database $APP_NAME $GX_FREEDB_ID
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
