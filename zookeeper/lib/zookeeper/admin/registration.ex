defmodule Zookeeper.Admin.Registration do
  import Ecto.Changeset, only: [put_change: 3]
  alias Comeonin.Bcrypt
  alias Zookeeper.Admin.User

  def create(changeset, repo) do
    changeset
    |> put_change(:encrypted_password, hashed_password(changeset.params["password"]))
    |> repo.insert()
  end

  defp hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
