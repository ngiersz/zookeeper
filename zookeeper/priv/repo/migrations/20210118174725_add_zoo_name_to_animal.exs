defmodule Zookeeper.Repo.Migrations.AddZooNameToAnimal do
  use Ecto.Migration

  def change do
    alter table("animals") do
      add(:zoo_name, :string)
    end
  end
end
