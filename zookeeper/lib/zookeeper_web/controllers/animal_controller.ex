defmodule ZookeeperWeb.AnimalController do
  use ZookeeperWeb, :controller

  import Ecto.Query

  alias Zookeeper.Repo
  alias Zookeeper.Animals.Animal
  alias Zookeeper.Zoos.Zoo

  def show(conn, %{"id" => id}) do
    animal =
      from(a in Animal,
        where: a.id == ^id
      )
      |> Repo.one()

    render(conn, "show.html", %{animal: animal})
  end
end
