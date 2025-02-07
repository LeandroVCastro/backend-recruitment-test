defmodule RecruitmentTest.Repo.Migrations.AddEnterprisesTable do
  use Ecto.Migration

  def change do
    create table("enterprises") do
      add :name, :string, null: false
      add :commercial_name, :string, null: false
      add :cnpj, :string, null: false
      add :description, :string, null: false

      timestamps()
      add :deleted_at, :utc_datetime
    end

    create unique_index(:enterprises, [:cnpj])
  end
end
