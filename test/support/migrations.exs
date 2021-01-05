defmodule EctoExtras.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :age, :integer

    timestamps()
  end
end

defmodule EctoExtras.Post do
  use Ecto.Schema

  schema "posts" do
    field :text, :string

    timestamps()
  end
end

defmodule EctoExtras.TestMigration do
  use Ecto.Migration

  def up do
    drop_if_exists table(:users)
    create table(:users) do
      add :name, :string
      add :age, :integer

      timestamps()
    end

    drop_if_exists table(:posts)
    create table(:posts) do
      add :text, :string

      timestamps()
    end
  end

  def down do
    drop_if_exists table(:users)
    drop_if_exists table(:posts)
  end
end
