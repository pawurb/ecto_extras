defmodule EctoExtras.Repo do
  @moduledoc """
  Helper functions for Ecto.Repo
  """

  require Ecto.Query

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do

      @doc """
      Returns first object from the query result. By default ordered by the primary key.
      """
      def first(queryable, order_by \\ nil)

      def first(queryable, order_by) do
        queryable |> Ecto.Query.first(order_by) |> one()
      end

      @doc """
      The same as `first` but raises Ecto.NoResultsError if object is not found.
      """
      def first!(queryable, order_by \\ nil)

      def first!(queryable, order_by) do
        queryable |> Ecto.Query.first(order_by) |> one!()
      end

      @doc """
      Returns last object from the query result. By default ordered by the primary key.
      """
      def last(queryable, order_by \\ nil)

      def last(queryable, order_by) do
        queryable |> Ecto.Query.last(order_by) |> one()
      end

      @doc """
      The same as `last` but raises Ecto.NoResultsError if object is not found.
      """
      def last!(queryable, order_by \\ nil)

      def last!(queryable, order_by) do
        queryable |> Ecto.Query.last(order_by) |> one!()
      end

      @doc """
      Returns count of objects from the query result.
      """
      def count(queryable, column \\ :id)

      def count(queryable, column) do
        aggregate(queryable, :count, column)
      end

      @doc """
      Returns the maximum value of a column from the query result.
      """
      def max(queryable, column) do
        aggregate(queryable, :max, column)
      end

      @doc """
      Returns the minimum value of a column from the query result.
      """
      def min(queryable, column) do
        aggregate(queryable, :min, column)
      end

      @doc """
      Returns the average value of a column from the query result.
      """
      def avg(queryable, column) do
        aggregate(queryable, :avg, column)
      end

      @doc """
      Returns the sum of column values from the query result.
      """
      def sum(queryable, column) do
        aggregate(queryable, :sum, column)
      end
    end
  end
end
