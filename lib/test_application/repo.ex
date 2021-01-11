defmodule TestApplication.Repo do
  use Ecto.Repo,
    otp_app: :test_application,
    adapter: Ecto.Adapters.Postgres
end
