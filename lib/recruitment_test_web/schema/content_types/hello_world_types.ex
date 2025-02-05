defmodule RecruitmentTestWeb.Schema.ContentTypes.HelloWorldTypes do
  use Absinthe.Schema.Notation

  object :hello_world_response do
    field :message, :string
    field :now, :string
  end
end
