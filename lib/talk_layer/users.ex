defmodule TalkLayer.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password, :string
    field :email, :string
    field :bio, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:name, :email, :bio, :password])
    |> validate_required([:name, :email, :bio, :password])
  end
end
