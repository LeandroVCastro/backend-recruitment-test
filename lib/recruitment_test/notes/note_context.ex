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

  # @spec delete_enterprise(:integer) :: {:ok, Enterprise} | {:error, Ecto.Changeset.t()} | nil
  # def delete_enterprise(id) do
  #   case get_enterprise(id) do
  #     nil -> nil

  #     enterprise -> enterprise |> Enterprise.changeset(%{
  #         deleted_at: DateTime.utc_now()
  #       })
  #       |> Repo.update()
  #   end
  # end

  # def list_enterprises(offset, limit) do
  #   query = from e in Enterprise,
  #         where: is_nil(e.deleted_at),
  #         offset: ^offset,
  #         limit: ^limit
  #   Repo.all(query)
  # end

  # def get_total_enterprises do
  #   query = from e in Enterprise,
  #           where: is_nil(e.deleted_at)
  #   Repo.aggregate(query, :count, :id)
  # end

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
