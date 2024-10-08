defmodule TestingAppWeb.ProjectController do
  use TestingAppWeb, :controller

  alias TestingApp.Users
  alias TestingApp.Projects
  alias TestingApp.Projects.Project

  def index(conn, _params) do
    projects = Projects.list_projects()
    render(conn, :index, projects: projects)
  end

  def new(conn, _params) do
    current_user = conn.assigns[:current_user]
    #users = Users.list_client_users()
    users = Users.list_users()
    changeset = Projects.change_project(%Project{})
    render(conn, :new, changeset: changeset, current_user: current_user, users: users)
  end

  def create(conn, %{"project" => project_params}) do
    #current_user = conn.assigns[:current_user]

    # Add the `created_by_id` to the project_params
    #project_params = Map.put(project_params, "created_by_id", current_user.id)

    IO.inspect(project_params, label: "Params")


    case Projects.create_project(project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    render(conn, :show, project: project)
  end

  def edit(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    users = Users.list_users()
    changeset = Projects.change_project(project)
    render(conn, :edit, project: project, changeset: changeset, users: users)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Projects.get_project!(id)

    case Projects.update_project(project, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project updated successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, project: project, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    {:ok, _project} = Projects.delete_project(project)

    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: ~p"/projects")
  end
end
