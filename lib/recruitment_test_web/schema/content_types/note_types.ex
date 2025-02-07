defmodule RecruitmentTestWeb.Schema.ContentTypes.NoteTypes do
  use Absinthe.Schema.Notation

  object :get_note_response do
    field :id, :string
    field :note, :string
    field :enterprise_id, :string
    field :enterprise, :get_enterprise_response do
      resolve fn %{enterprise_id: enterprise_id}, _args, _ ->
        RecruitmentTestWeb.Resolvers.EnterpriseResolver.get_enterprise(nil, %{id: enterprise_id}, nil)
      end
    end
    field :inserted_at, :string
    field :updated_at, :string
  end

  # object :list_enterprise_response do
  #   field :items, list_of(:get_enterprise_response)
  # end

  # object :delete_enterprise_response do
  #   field :success, :boolean
  # end

  # input_object :create_enterprise_input do
  #   field :name, :string
  #   field :commercial_name, :string
  #   field :cnpj, :string
  #   field :description, :string
  # end
end
