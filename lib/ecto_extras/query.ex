defmodule EctoExtras.Query do
  @moduledoc """
  Helper functions for Ecto.Query
  """

  @doc """
  Transform column to lowercase.
  """
  defmacro upper(arg) do
    quote do
      fragment("upper(?)", unquote(arg))
    end
  end

  @doc """
  Transform column to uppercase.
  """
  defmacro lower(arg) do
    quote do
      fragment("lower(?)", unquote(arg))
    end
  end
end
