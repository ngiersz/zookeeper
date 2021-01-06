defmodule Zookeeper.Repo.Migrations.AddZoos do
  use Ecto.Migration

  def change do
    create table("zoos") do
      add(:name, :string)
    end
  end
end
