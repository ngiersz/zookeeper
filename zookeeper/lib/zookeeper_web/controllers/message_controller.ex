defmodule ZookeeperWeb.MessageController do
  use ZookeeperWeb, :controller

  alias Zookeeper.Repo
  alias Zookeeper.Messages.Message

  def new(conn, params) do
    %Message{email: Map.get(params, "email"), content: Map.get(params, "content")}
    |> Repo.insert()

    render(conn, "new.html", %{})
  end
end
