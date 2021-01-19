defmodule Zookeeper.Repo.Migrations.RenamePriceCentsToPriceInAnimals do
  use Ecto.Migration

  def change do
    rename(table("animals"), :price_cents, to: :price)
  end
end
