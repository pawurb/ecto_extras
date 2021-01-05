defmodule EctoExtras.Mixfile do
  use Mix.Project
  @github_url "https://github.com/pawurb/ecto_extras"
  @version "0.0.1"

  def project do
    [
      app: :ecto_extras,
      version: @version,
      elixir: "~> 1.5",
      escript: [main_module: EctoExtras],
      description: description(),
      deps: deps(),
      package: package(),
      docs: docs()
    ]
  end

  def deps do
    [
      {:ecto_sql, "~> 3.4"},
      {:ecto_explain, "0.1.2"},
      {:postgrex, ">= 0.15.7", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Ecto extra helper functions.
    """
  end

  defp package do
    [
      maintainers: ["Pawel Urbanek"],
      licenses: ["MIT"],
      links: %{"GitHub" => @github_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @github_url,
      extras: ["README.md"]
    ]
  end
end
