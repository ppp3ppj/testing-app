defmodule TestingApp.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :description, :string
    #field :created_by_id, :id
    belongs_to :created_by, TestingApp.Accounts.User, foreign_key: :created_by_id


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :created_by_id])
    |> validate_required([:name, :description, :created_by_id])
  end
end
