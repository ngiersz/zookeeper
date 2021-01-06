defmodule Zookeeper.Repo do
  use Ecto.Repo,
    otp_app: :zookeeper,
    adapter: Ecto.Adapters.Postgres
end
