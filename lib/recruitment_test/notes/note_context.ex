defmodule RecruitmentTest.NoteContext do
  import Ecto.Query
  alias RecruitmentTest.Enterprises.Enterprise
  alias RecruitmentTest.Repo
  alias RecruitmentTest.Notes.Note

  def get_note(id) do
    query = from e in Note,
          where: is_nil(e.deleted_at)
    Repo.get(query, id)
  end

  @spec delete_note(:id) :: {:ok, Note} | {:error, Ecto.Changeset.t()} | nil
  def delete_note(id) do
    case get_note(id) do
      nil -> nil

      note_record -> note_record |> Note.changeset(%{
          deleted_at: DateTime.utc_now()
        })
        |> Repo.update()
    end
  end

  def list_notes_by_enterprise_id(enterprise_id) do
    query = from e in Note,
          where: is_nil(e.deleted_at),
          where: e.enterprise_id == ^enterprise_id,
          order_by: [desc: :updated_at]

    Repo.all(query)
  end

  @spec create_note(:string, :id) :: {:ok, Note} | {:error, Ecto.Changeset.t()} | nil
  def create_note(note, enterprise_id) do
    query = from e in Enterprise,
          where: is_nil(e.deleted_at)
    case Repo.get(query, enterprise_id) do
      nil -> nil

      enterprise -> %Note{} |> Note.changeset(%{
            note: note,
            enterprise_id: enterprise.id,
          })
        |> Repo.insert()
    end

  end

  @spec update_note(:string, :id) :: {:ok, Note} | {:error, Ecto.Changeset.t()} | nil
  def update_note(note, id) do
    case get_note(id) do
      nil -> nil

      note_record -> note_record |> Note.changeset(%{
          note: note,
        })
        |> Repo.update()
    end
  end

end
