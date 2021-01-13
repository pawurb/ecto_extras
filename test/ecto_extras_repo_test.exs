defmodule EctoExtrasRepoTest do
  use ExUnit.Case
  import Ecto.Migrator
  alias EctoExtras.TestRepo

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

    one_day_from_now = NaiveDateTime.utc_now()
      |> NaiveDateTime.add(60 * 60 * 24 * 1)
      |> NaiveDateTime.truncate(:second)

    two_days_from_now = NaiveDateTime.utc_now()
      |> NaiveDateTime.add(60 * 60 * 24 * 2)
      |> NaiveDateTime.truncate(:second)

    user1 = %User{
      name: "user1",
      age: 18,
      updated_at: two_days_from_now
    }

    user2 = %User{
      name: "user2",
      age: 32,
      updated_at: one_day_from_now
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

  test ".first" do
    assert TestRepo.first(User).name == "user1"
    assert TestRepo.first(User, :updated_at).name == "user2"
  end

  test ".first!" do
    assert TestRepo.first!(User).name == "user1"
    assert TestRepo.first!(User, :updated_at).name == "user2"
    assert_raise Ecto.NoResultsError, ~r"expected at least one result", fn ->
      assert TestRepo.first!(Post)
    end
  end

  test ".last" do
    assert TestRepo.last(User).name == "user2"
    assert TestRepo.last(User, :updated_at).name == "user1"
  end

  test ".last!" do
    assert TestRepo.last!(User).name == "user2"
    assert TestRepo.last!(User, :updated_at).name == "user1"
    assert_raise Ecto.NoResultsError, ~r"expected at least one result", fn ->
      assert TestRepo.last!(Post)
    end
  end

  test ".count" do
    assert TestRepo.count(User) == 2
    assert TestRepo.count(User, :name) == 2
  end

  test ".min" do
    assert TestRepo.min(User, :age) == 18
  end

  test ".max" do
    assert TestRepo.max(User, :age) == 32
  end

  test ".avg" do
    assert Decimal.compare(TestRepo.avg(User, :age), 25) == :eq
  end

  test ".sum" do
    assert TestRepo.sum(User, :age) == 50
  end
end
