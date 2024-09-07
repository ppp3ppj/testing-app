defmodule TestingApp.Users do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias TestingApp.Repo

  alias TestingApp.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  def list_client_users do
    Repo.all(from u in User, where: u.global_role == :client)
  end
end
