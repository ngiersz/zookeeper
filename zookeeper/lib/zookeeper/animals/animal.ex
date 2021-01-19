defmodule Zookeeper.Animals.Animal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "animals" do
    field(:name, :string)
    field(:price, :integer)
    field(:description, :string)
    field(:benefits, :string)
    field(:photo_url, :string)

    field(:zoo_name, :string)

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = animal, attrs \\ %{}) do
    animal
    |> cast(attrs, [:name, :price, :description, :benefits, :photo_url, :zoo_name])
    |> validate_required([:name, :price, :description, :benefits, :zoo_name])
  end
end
