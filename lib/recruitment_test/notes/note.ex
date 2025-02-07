defmodule RecruitmentTest.Notes.Note do
  use RecruitmentTest.Schema

  import Ecto.Changeset

  schema "notes" do
    field :note, :string
    belongs_to :enterprise, RecruitmentTest.Enterprises.Enterprise

    field :deleted_at, :utc_datetime
    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [
      :note,
      :enterprise_id,
      :deleted_at
    ])
    |> handle_note()
    |> handle_deleted_at()
    |> handle_enterprise_id()
  end

  defp handle_enterprise_id(changeset), do: changeset

  defp handle_note(changeset) do
    changeset
    |> validate_required(:note)
  end

  defp handle_deleted_at(changeset) do
    changeset
  end

end
