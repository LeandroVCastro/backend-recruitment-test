defmodule RecruitmentTestWeb.Schema.ContentTypes.NoteTypes do
  use Absinthe.Schema.Notation

  object :notes_default do
    field :id, :string
    field :note, :string
    field :enterprise_id, :string
    field :inserted_at, :string
    field :updated_at, :string
  end

  object :create_note_response do
    import_fields(:notes_default)
    field :enterprise, :get_enterprise_response do
      resolve fn %{enterprise_id: enterprise_id}, _args, _ ->
        RecruitmentTestWeb.Resolvers.EnterpriseResolver.get_enterprise(nil, %{id: enterprise_id}, nil)
      end
    end
  end

  object :delete_note_response do
    field :success, :boolean
  end
end
