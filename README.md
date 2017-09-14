# JradNet

## dev setup

```shell
$ mix deps.get

# get postgres set running...

$ mix ecto.setup
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
