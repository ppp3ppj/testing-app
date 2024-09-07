defmodule TestingAppWeb.ProjectHTML do
  use TestingAppWeb, :html

  embed_templates "project_html/*"

  @doc """
  Renders a project form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :current_user, TestingApp.Accounts.User, required: true
  attr :users, :list, default: []

  def project_form(assigns)
end
