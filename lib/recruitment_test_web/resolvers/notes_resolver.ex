defmodule RecruitmentTestWeb.Resolvers.NoteResolver do
  alias RecruitmentTest.NoteContext

  # def get_enterprise(_, %{id: id}, _) do
  #   case EnterpriseContext.get_enterprise(id) do
  #     nil -> {:error, "Enterprise not found"}
  #     enterprise -> {:ok, enterprise}
  #   end
  # end

  # def list_enterprises(_, args, _) do
  #   offset = Map.get(args, :offset)
  #   limit = Map.get(args, :limit)
  #   enterprises = EnterpriseContext.list_enterprises(offset, limit)
  #   enterprises_map = Enum.map(enterprises, &Map.from_struct(&1))
  #   {:ok, %{items: enterprises_map}}
  # end

  # def get_total_enterprises(_, _, _) do
  #   {:ok, EnterpriseContext.get_total_enterprises()}
  # end

  @spec create_note(nil, map(), nil) :: {:error, :string} | {:ok, RecruitmentTest.Notes.Note}
  def create_note(_, args, _) do
    note = Map.get(args, :note)
    enterprise_id = Map.get(args, :enterprise_id)
    case NoteContext.create_note(note, enterprise_id) do
      {:ok, noteRecord} -> {:ok, noteRecord}
      {:error, changeset} -> {:error, "#{inspect(changeset.errors)}"}
      nil -> {:error, "Enterprise not found"}
    end
  end

  def update_note(_, args, _) do
    note = Map.get(args, :note)
    id = Map.get(args, :id)
    case NoteContext.update_note(note, id) do
      {:ok, note_record} -> {:ok, note_record}
      {:error, changeset} -> {:error, "#{inspect(changeset.errors)}"}
      nil -> {:error, "Note not found"}
    end
  end

  # @spec delete_enterprise(nil, map(), nil) :: {:error, binary()} | {:ok, %{success: true}}
  # def delete_enterprise(_, args, _) do
  #   id = Map.get(args, :id)
  #   case EnterpriseContext.delete_enterprise(id) do
  #     {:ok, _} -> {:ok, %{success: true}}
  #     {:error, changeset} -> {:error, "#{inspect(changeset.errors)}"}
  #     nil -> {:error, "Enterprise not found"}
  #   end
  # end
end
