defmodule TestingAppWeb.UserControll do
  alias TestingApp.Users
  use TestingAppWeb, :controller

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, :index, users: users)
  end
end
