defmodule RecruitmentTestWeb.Resolvers.EnterpriseResolver do
  alias RecruitmentTest.EnterpriseContext

  def get_enterprise(_, %{id: id}, _) do
    {:ok, EnterpriseContext.get_enterprise(id)}
  end

  def list_enterprises(_, args, _) do
    offset = Map.get(args, :offset)
    limit = Map.get(args, :limit)
    enterprises = EnterpriseContext.list_enterprises(offset, limit)
    enterprises_map = Enum.map(enterprises, &Map.from_struct(&1))
    {:ok, %{items: enterprises_map}}
  end

  def get_total_enterprises(_, _, _) do
    {:ok, EnterpriseContext.get_total_enterprises()}
  end
end
