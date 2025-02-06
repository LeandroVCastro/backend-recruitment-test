defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema
  import_types(RecruitmentTestWeb.Schema.ContentTypes.HelloWorldTypes)
  import_types(RecruitmentTestWeb.Schema.Queries.HelloWorldQueries)
  import_types(RecruitmentTestWeb.Schema.ContentTypes.EnterpriseTypes)
  import_types(RecruitmentTestWeb.Schema.Queries.EnterpriseQueries)
  import_types(RecruitmentTestWeb.Schema.Mutations.EnterpriseMutations)


  query do
    import_fields(:hello_world_queries)
    import_fields(:enterprise_queries)
  end

  mutation do
    import_fields(:enterprise_mutations)
  end

end
