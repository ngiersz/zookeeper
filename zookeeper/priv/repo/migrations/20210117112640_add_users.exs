defmodule Zookeeper.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table("users") do
      add(:encrypted_password, :string)
      add(:username, :string)

      timestamps()
    end
  end
end
