defmodule TalkLayer.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :bio, :string
      add :password, :string

      timestamps(type: :utc_datetime)
    end
  end
end