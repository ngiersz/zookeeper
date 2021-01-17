defmodule ZookeeperWeb.AdminController do
  use ZookeeperWeb, :controller

  import Ecto.Query

  alias Zookeeper.Repo
  alias Zookeeper.Animals.Animal

  def animals(conn, _) do
    animals =
      from(Animal)
      |> preload([:zoo])
      |> Repo.all()

    render(conn, "animals.html", %{animals: animals})
  end

  def delete_animal(conn, %{"animal_id" => animal_id}) do
    Animal
    |> Repo.get(animal_id)
    |> Repo.delete()

    redirect(conn, to: Routes.admin_path(conn, :animals))
  end
end
