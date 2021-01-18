defmodule ZookeeperWeb.PageController do
  use ZookeeperWeb, :controller

  import Ecto.Query

  alias Zookeeper.Repo
  alias Zookeeper.Animals.Animal
  alias Zookeeper.Zoos.Zoo

  def index(conn, _params) do
    animals =
      from(Animal)
      |> Repo.all()

    render(conn, "index.html", %{animals: animals})
  end
end
