defmodule EctoExtras.TestRepo do
  use Ecto.Repo, otp_app: :ecto_extras, adapter: Ecto.Adapters.Postgres
  use EctoExtras.Repo

  def init(type, opts) do
    database_url = "ecto://#{System.get_env("POSTGRES_USER")}:#{System.get_env("POSTGRES_PASSWORD")}@#{System.get_env("POSTGRES_HOST")}:#{System.get_env("POSTGRES_PORT")}/#{System.get_env("POSTGRES_DB")}"
    opts = [url: database_url] ++ opts
    opts[:parent] && send(opts[:parent], {__MODULE__, type, opts})
    {:ok, opts}
  end
end

EctoExtras.TestRepo.start_link()
