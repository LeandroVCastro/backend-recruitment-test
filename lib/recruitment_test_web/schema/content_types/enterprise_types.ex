defmodule RecruitmentTestWeb.Schema.ContentTypes.EnterpriseTypes do
  use Absinthe.Schema.Notation

  object :get_enterprise_response do
    field :id, :string
    field :name, :string
    field :commercial_name, :string
    field :cnpj, :string
    field :description, :string
    field :inserted_at, :string
    field :updated_at, :string
    field :notes, list_of(:notes_on_enterprise) do
      resolve fn %{id: enterprise_id}, _args, _ ->
        RecruitmentTestWeb.Resolvers.NoteResolver.list_notes_by_enterprise_id(nil, %{enterprise_id: enterprise_id}, nil)
      end
    end
  end

  object :notes_on_enterprise do
    field :id, :string
    field :note, :string
    field :inserted_at, :string
    field :updated_at, :string
  end

  object :list_enterprise_response do
    field :items, list_of(:get_enterprise_response)
  end

  object :delete_enterprise_response do
    field :success, :boolean
  end

  input_object :create_enterprise_input do
    field :name, :string
    field :commercial_name, :string
    field :cnpj, :string
    field :description, :string
  end
end
