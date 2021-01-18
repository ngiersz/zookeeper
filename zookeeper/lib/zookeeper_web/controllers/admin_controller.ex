defmodule ZookeeperWeb.AdminController do
  use ZookeeperWeb, :controller

  import Ecto.Query

  alias Zookeeper.Repo
  alias Zookeeper.Animals.Animal

  def animals(conn, _) do
    animals =
      from(Animal)
      |> Repo.all()

    render(conn, "animals.html", %{animals: animals})
  end

  def delete_animal(conn, %{"animal_id" => animal_id}) do
    Animal
    |> Repo.get(animal_id)
    |> Repo.delete()

    redirect(conn, to: Routes.admin_path(conn, :animals))
  end

  def add_animal(conn, _) do
    changeset = Animal.changeset(%Animal{})

    render(conn, "add_animal.html", %{changeset: changeset})
  end

  def create_animal(conn, params) do
    %Animal{}
    |> Animal.changeset(params["animal"])
    |> Repo.insert!()

    redirect(conn, to: Routes.admin_path(conn, :animals))
  end
end
