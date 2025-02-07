defmodule RecruitmentTestWeb.Schema.Mutations.EnterpriseMutations do
  use Absinthe.Schema.Notation
  alias RecruitmentTestWeb.Resolvers.EnterpriseResolver


  object :enterprise_mutations do
    description "Enterprise Queries"
    field :create_enterprise, :get_enterprise_response do
      description "Create a new Enterprise"
      arg :name, non_null(:string)
      arg :commercial_name, non_null(:string)
      arg :description, non_null(:string)
      arg :cnpj, non_null(:string)
      resolve(&EnterpriseResolver.create_enterprise/3)
    end

    field :update_enterprise, :get_enterprise_response do
      description "Update an Enterprise by ID"
      arg :id, non_null(:id)
      arg :name, non_null(:string)
      arg :commercial_name, non_null(:string)
      arg :description, non_null(:string)
      arg :cnpj, non_null(:string)
      resolve(&EnterpriseResolver.update_enterprise/3)
    end

    field :delete_enterprise, :delete_enterprise_response do
      description "Delete an Enterprise by ID"
      arg :id, non_null(:id)
      resolve(&EnterpriseResolver.delete_enterprise/3)
    end
  end
end
