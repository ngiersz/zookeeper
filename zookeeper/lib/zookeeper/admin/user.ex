defmodule Zookeeper.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:encrypted_password, :string)
    field(:username, :string)

    field(:password, :string, virtual: true)

    timestamps()
  end

  def changeset(%__MODULE__{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username])
    |> validate_length(:password, min: 3)
    |> validate_confirmation(:password)
    |> validate_format(:username, ~r/^[a-z0-9][a-z0-9]+[a-z0-9]$/i)
    |> validate_length(:username, min: 3)
    |> unique_constraint(:username)
  end
end
