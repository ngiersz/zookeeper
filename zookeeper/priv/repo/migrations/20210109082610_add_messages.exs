defmodule Zookeeper.Repo.Migrations.AddMessages do
  use Ecto.Migration

  def change do
    create table("messages") do
      add(:email, :string)
      add(:content, :text)

      timestamps()
    end
  end
end
