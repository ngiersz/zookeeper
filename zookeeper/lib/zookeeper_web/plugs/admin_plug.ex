defmodule ZookeeperWeb.Plug.AdminPlug do
  alias Zookeeper.Admin.User
  alias Zookeeper.Repo

  def init(opts), do: opts

  def call(conn, _opts) do
    conn = Plug.Conn.fetch_session(conn)

    user =
      conn
      |> Plug.Conn.get_session(:current_user)
      |> case do
        nil -> nil
        id -> Repo.get(User, id)
      end

    Plug.Conn.assign(conn, :current_user, user)
  end
end
