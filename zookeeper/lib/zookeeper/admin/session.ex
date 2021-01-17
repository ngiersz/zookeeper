defmodule Zookeeper.Admin.Session do
  import Ecto.Changeset, only: [put_change: 3]
  import Ecto.Query

  alias Zookeeper.Admin.User
  alias Zookeeper.Repo

  def logged_in?(conn), do: !!current_user(conn)

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Repo.get(User, id)
  end

  def login(%{password: password, username: username} = params) do
    user =
      from(u in User,
        where: u.username == ^username
      )
      |> Repo.one()

    case authenticate(user, password) do
      true -> {:ok, user}
      _ -> :error
    end
  end

  defp authenticate(user, password) do
    user |> IO.inspect()
    password |> IO.inspect()

    case user do
      nil -> false
      _ -> Comeonin.Bcrypt.checkpw(password, user.encrypted_password)
    end
  end
end
