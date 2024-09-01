# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TestingApp.Repo.insert!(%TestingApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TestingApp.Accounts

users = [
  %{
    email: "admin@admin.com",
    password: "341234123412",
    password_confirmation: "341234123412",
    global_role: "admin"
  },
  %{
    email: "client@client.com",
    password: "341234123412",
    password_confirmation: "341234123412",
    global_role: "client"
  },
]

for user_params <- users do
  case user_params[:global_role] do
    "admin" ->
      case Accounts.register_user_role(user_params) do
        {:ok, user} ->
          IO.puts("Inserted admin user: #{user.email} with role: #{user.global_role}")

        {:error, changeset} ->
          IO.puts("Failed to insert admin user: #{inspect(changeset.errors)}")
      end

    "client" ->
      case Accounts.register_user(user_params) do
        {:ok, user} ->
          IO.puts("Inserted client user: #{user.email} with role: #{user.global_role}")

        {:error, changeset} ->
          IO.puts("Failed to insert client user: #{inspect(changeset.errors)}")
      end
  end
end

