defmodule Zookeeper.Zoos.Zoo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "zoos" do
    field(:name, :string)
  end

  @doc false
  def changeset(%__MODULE__{} = zoo, attrs) do
    zoo
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
