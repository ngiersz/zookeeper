defmodule ZookeeperWeb.AdminController do
  use ZookeeperWeb, :controller

  import Ecto.Query

  alias Zookeeper.Repo
  alias Zookeeper.Animals.Animal
  alias Zookeeper.Messages.Message

  def messages(%{assigns: %{current_user: current_user}} = conn, _) do
    case current_user do
      %{id: _} ->
        messages =
          from(Message)
          |> order_by([m], desc: m.inserted_at)
          |> Repo.all()

        render(conn, "messages.html", %{messages: messages})

      _ ->
        conn
        |> send_resp(403, "Not allowed")
        |> halt
    end
  end

  def animals(%{assigns: %{current_user: current_user}} = conn, _) do
    case current_user do
      %{id: _} ->
        animals =
          from(Animal)
          |> order_by([a], a.id)
          |> Repo.all()

        render(conn, "animals.html", %{animals: animals})

      _ ->
        conn
        |> send_resp(403, "Not allowed")
        |> halt
    end
  end

  def delete_animal(conn, %{"animal_id" => animal_id}) do
    Animal
    |> Repo.get(animal_id)
    |> Repo.delete()

    redirect(conn, to: Routes.admin_path(conn, :animals))
  end

  def add_animal(%{assigns: %{current_user: current_user}} = conn, _) do
    case current_user do
      %{id: _} ->
        changeset = Animal.changeset(%Animal{})

        render(conn, "add_animal.html", %{changeset: changeset})

      _ ->
        conn
        |> send_resp(403, "Not allowed")
        |> halt
    end
  end

  def create_animal(conn, params) do
    %Animal{}
    |> Animal.changeset(params["animal"])
    |> Repo.insert!()

    redirect(conn, to: Routes.admin_path(conn, :animals))
  end

  def edit_animal_form(%{assigns: %{current_user: current_user}} = conn, %{
        "animal_id" => animal_id
      }) do
    case current_user do
      %{id: _} ->
        animal =
          Animal
          |> Repo.get(animal_id)

        changeset = Animal.changeset(animal)

        render(conn, "edit_animal.html", %{changeset: changeset, animal: animal})

      _ ->
        conn
        |> send_resp(403, "Not allowed")
        |> halt
    end
  end

  def update_animal(
        %{assigns: %{current_user: current_user}} = conn,
        %{"animal" => animal, "id" => animal_id} = params
      ) do
    case current_user do
      %{id: _} ->
        changeset =
          Animal
          |> Repo.get(animal_id)
          |> Animal.changeset(animal)

        case Repo.update(changeset) do
          {:ok, animal} ->
            conn
            |> redirect(to: Routes.admin_path(conn, :animals))

          {:error, changeset} ->
            render(conn, "edit_animal.html", changeset: changeset, animal: animal)
        end

      _ ->
        conn
        |> send_resp(403, "Not allowed")
        |> halt
    end
  end
end
