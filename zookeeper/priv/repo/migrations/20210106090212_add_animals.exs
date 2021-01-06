defmodule Zookeeper.Repo.Migrations.AddAnimals do
  use Ecto.Migration

  def change do
    create table("animals") do
      add(:name, :string)
      add(:price_cents, :integer)
      add(:description, :text)
      add(:benefits, :text)
      add(:photo_url, :string)
      add(:zoo_id, references(:zoos), null: false)

      timestamps()
    end
  end
end
