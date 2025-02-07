defmodule RecruitmentTestWeb.Schema.Mutations.NoteMutations do
  use Absinthe.Schema.Notation
  alias RecruitmentTestWeb.Resolvers.NoteResolver


  object :note_mutations do
    description "Note Queries"
    field :create_note, :get_note_response do
      description "Add a note to an Enterprise"
      arg :note, non_null(:string)
      arg :enterprise_id, non_null(:id)
      resolve(&NoteResolver.create_note/3)
    end

    field :update_note, :get_note_response do
      description "Update an Note by ID"
      arg :id, non_null(:id)
      arg :note, non_null(:string)
      resolve(&NoteResolver.update_note/3)
    end

    field :delete_note, :delete_note_response do
      description "Delete an Note by ID"
      arg :id, non_null(:id)
      resolve(&NoteResolver.delete_note/3)
    end
  end
end
