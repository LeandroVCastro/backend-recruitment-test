defmodule RecruitmentTestWeb.Schema.Queries.HelloWorldQueries do
  use Absinthe.Schema.Notation

  alias RecruitmentTestWeb.Resolvers

  object :hello_world_queries do
    field :hello_world, :hello_world_response do
      resolve(&Resolvers.HelloWorldResolver.get/3)
    end
  end
end
