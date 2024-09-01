defmodule TestingApp.Repo.Migrations.AddRoleToUsers do
  use Ecto.Migration

  def change do
    alter table (:users) do
      add :global_role, :string, null: false, default: "client"
    end
  end
end
