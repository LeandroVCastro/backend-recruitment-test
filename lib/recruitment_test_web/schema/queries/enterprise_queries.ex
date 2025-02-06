defmodule RecruitmentTestWeb.Schema.Queries.EnterpriseQueries do
  use Absinthe.Schema.Notation
  # import_types(RecruitmentTestWeb.Schema.ContentTypes.EnterpriseTypes)
  alias RecruitmentTestWeb.Resolvers


  @desc "Consultas relacionadas a Empresas"
  object :enterprise_queries do
    field :get_enterprise, :get_enterprise_response do
      description "Get a single enterprise by its ID"
      arg :id, non_null(:id)
      resolve(&Resolvers.EnterpriseResolver.get_enterprise/3)
    end

    field :list_enterprises, :list_enterprise_response do
      description "List enterprises"
      arg :offset, :integer, default_value: 0
      arg :limit, :integer, default_value: 10
      resolve(&Resolvers.EnterpriseResolver.list_enterprises/3)
    end

    field :get_total_enterprises, :integer do
      description "Get the current total of enterprises"
      resolve(&Resolvers.EnterpriseResolver.get_total_enterprises/3)
    end

  end
end
