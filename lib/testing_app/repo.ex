defmodule TestingApp.Repo do
  use Ecto.Repo,
    otp_app: :testing_app,
    adapter: Ecto.Adapters.SQLite3
end
