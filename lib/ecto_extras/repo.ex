defmodule EctoExtras.Repo do
  @moduledoc """
  Helper functions for Ecto.Repo
  """

  require Ecto.Query

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do

      def first(queryable, order_by \\ nil)

      def first(queryable, order_by) do
        queryable |> Ecto.Query.first(order_by) |> one()
      end

      def first!(queryable, order_by \\ nil)

      def first!(queryable, order_by) do
        queryable |> Ecto.Query.first(order_by) |> one!()
      end

      def last(queryable, order_by \\ nil)

      def last(queryable, order_by) do
        queryable |> Ecto.Query.last(order_by) |> one()
      end

      def last!(queryable, order_by \\ nil)

      def last!(queryable, order_by) do
        queryable |> Ecto.Query.last(order_by) |> one!()
      end

      def count(queryable, column \\ :id)

      def count(queryable, column) do
        aggregate(queryable, :count, column)
      end

      def min(queryable, column) do
        aggregate(queryable, :min, column)
      end

      def max(queryable, column) do
        aggregate(queryable, :max, column)
      end

      def avg(queryable, column) do
        aggregate(queryable, :avg, column)
      end

      def sum(queryable, column) do
        aggregate(queryable, :sum, column)
      end
    end
  end

  @doc """
  Returns first object from the query result. By default ordered by the primary key.
  """
  @callback first(query :: Ecto.Queryable.t(), column :: atom) :: Ecto.Schema.t() | nil

  @doc """
  The same as `first` but raises Ecto.NoResultsError if object is not found.
  """
  @callback first!(query :: Ecto.Queryable.t(), column :: atom) :: Ecto.Schema.t()

  @doc """
  Returns last object from the query result. By default ordered by the primary key.
  """
  @callback last(query :: Ecto.Queryable.t(), column :: atom) :: Ecto.Schema.t() | nil

  @doc """
  The same as `last` but raises Ecto.NoResultsError if object is not found.
  """
  @callback last!(query :: Ecto.Queryable.t(), column :: :id) :: Ecto.Schema.t()

  @doc """
  Returns count of objects from the query result.
  """
  @callback count(query :: Ecto.Queryable.t(), column :: atom) :: term | nil

  @doc """
  Returns the minimum value of a column from the query result.
  """
  @callback min(query :: Ecto.Queryable.t(), column :: atom) :: term | nil

  @doc """
  Returns the maximum value of a column from the query result.
  """
  @callback max(query :: Ecto.Queryable.t(), column :: atom) :: term | nil

  @doc """
  Returns the average value of a column from the query result.
  """
  @callback avg(query :: Ecto.Queryable.t(), column :: atom) :: term | nil

  @doc """
  Returns the sum of column values from the query result.
  """
  @callback sum(query :: Ecto.Queryable.t(), column :: atom) :: term | nil

end
