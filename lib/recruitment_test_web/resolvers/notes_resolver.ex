defmodule RecruitmentTestWeb.Resolvers.NoteResolver do
  alias RecruitmentTest.NoteContext

  def list_notes_by_enterprise_id(_, args, _) do
    enterprise_id = Map.get(args, :enterprise_id)
    notes = NoteContext.list_notes_by_enterprise_id(enterprise_id)
    notes = Enum.map(notes, &Map.from_struct(&1))
    {:ok, notes}
  end

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

  @spec delete_note(nil, map(), nil) :: {:error, binary()} | {:ok, %{success: true}}
  def delete_note(_, args, _) do
    id = Map.get(args, :id)
    case NoteContext.delete_note(id) do
      {:ok, _} -> {:ok, %{success: true}}
      {:error, changeset} -> {:error, "#{inspect(changeset.errors)}"}
      nil -> {:error, "Note not found"}
    end
  end
end
