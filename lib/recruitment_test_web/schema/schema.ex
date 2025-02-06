defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema
  import_types(RecruitmentTestWeb.Schema.ContentTypes.HelloWorldTypes)
  import_types(RecruitmentTestWeb.Schema.Queries.HelloWorldQueries)
  import_types(RecruitmentTestWeb.Schema.ContentTypes.EnterpriseTypes)
  import_types(RecruitmentTestWeb.Schema.Queries.EnterpriseQueries)
  import_types(RecruitmentTestWeb.Schema.Mutations.EnterpriseMutations)


  query do
    field :hello_word, :hello_world_queries
    field :enterprise_queries, :enterprise_queries
  end

  mutation do
    field :enterprise_mutations, :enterprise_mutations
  end

end
