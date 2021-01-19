defmodule Zookeeper.Animals.Animal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "animals" do
    field(:name, :string)
    field(:price_cents, :integer)
    field(:description, :string)
    field(:benefits, :string)
    field(:photo_url, :string)

    field(:zoo_name, :string)

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = animal, attrs \\ %{}) do
    animal
    |> cast(attrs, [:name, :description, :benefits, :photo_url, :zoo_name])
    |> put_change(:price_cents, calculate_price_cents(attrs["price"]))
    |> validate_required([:name, :price_cents, :description, :benefits, :zoo_name])
  end

  defp calculate_price_cents(nil), do: nil

  defp calculate_price_cents(price) do
    {integer, _} = Integer.parse(price)
    integer * 100
  end
end
