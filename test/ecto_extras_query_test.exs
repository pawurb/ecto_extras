defmodule EctoExtrasQueryTest do
  use ExUnit.Case
  import Ecto.Migrator
  import EctoExtras.Query
  alias EctoExtras.TestRepo
  import Ecto.Query

  alias EctoExtras.{
    User,
    Post,
    TestMigration
  }


  setup do
    num = System.unique_integer([:positive])

    up(
      TestRepo,
      num,
      TestMigration,
      log: false
    )

    user1 = %User{
      name: "user1"
    }

    user2 = %User{
      name: "USER2"
    }

    TestRepo.insert(user1)
    TestRepo.insert(user2)

    on_exit(fn ->
      down(
        TestRepo,
        num,
        TestMigration,
        log: false
      )

      TestRepo.query!("DELETE FROM schema_migrations")
    end)
  end

  test ".lower" do
    assert TestRepo.one(from u in User, where: upper(u.name) == "USER1").name == "user1"
  end

  test ".upper" do
    assert TestRepo.one(from u in User, where: lower(u.name) == "user2").name == "USER2"
  end
end
