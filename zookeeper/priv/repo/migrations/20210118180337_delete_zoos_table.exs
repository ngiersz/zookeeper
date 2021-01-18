defmodule Zookeeper.Repo.Migrations.DeleteZoosTable do
  use Ecto.Migration

  def change do
    alter table("animals") do
      remove(:zoo_id)
    end
  end
end
