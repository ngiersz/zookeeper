defmodule Zookeeper.Animals.Animal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "animals" do
    field(:name, :string)
    field(:price_cents, :integer)
    field(:description, :string)
    field(:benefits, :string)
    field(:photo_url, :string)
    belongs_to(:zoo, Zookeeper.Zoos.Zoo)

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = animal, attrs) do
    animal
    |> cast(attrs, [:name, :price_cents, :description, :benefits, :photo_url])
    |> validate_required([:name, :price_cents, :description, :benefits])
  end
end
