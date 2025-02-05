defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema
  import_types(RecruitmentTestWeb.Schema.Queries.HelloWorldQueries)
  import_types(RecruitmentTestWeb.Schema.Queries.EnterpriseQueries)

  query do
    import_fields(:hello_world_queries)
    import_fields(:enterprise_queries)
  end
end
