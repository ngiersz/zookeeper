defmodule ZookeeperWeb.SessionController do
  use ZookeeperWeb, :controller

  import Ecto.Query

  alias Zookeeper.Repo
  alias Zookeeper.Admin.User

  def new(conn, attrs) do
    render(conn, "new.html")
  end

  def create(conn, attrs) do
    case Zookeeper.Admin.Session.login(%{username: attrs["username"], password: attrs["password"]}) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: "/")

      :error ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
