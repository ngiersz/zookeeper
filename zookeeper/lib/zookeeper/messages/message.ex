defmodule Zookeeper.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field(:email, :string)
    field(:content, :string)

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = message, attrs) do
    message
    |> cast(attrs, [:email, :content])
    |> validate_required([:email, :content])
  end
end
