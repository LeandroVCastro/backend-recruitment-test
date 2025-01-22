defmodule RecruitmentTest.Repo.Migrations.AddEnterprisesTable do
  use Ecto.Migration

  def change do
    create table("enterprises") do
      add :name, :string, null: false
      add :commercial_name, :string, null: false
      add :cnpj, :string, null: false
      add :description, :string, null: false

      timestamps()
      # soft_delete_columns()
    end

    create unique_index(:enterprises, [:cnpj])
  end
end
