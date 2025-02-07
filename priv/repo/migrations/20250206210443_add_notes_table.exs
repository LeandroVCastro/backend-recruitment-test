defmodule RecruitmentTest.Repo.Migrations.AddNotesTable do
  use Ecto.Migration

  def change do
    create table("notes") do
      add :note,    :string, null: false
      add :enterprise_id, references("enterprises")
      timestamps()
      add :deleted_at, :utc_datetime
    end
  end
end
