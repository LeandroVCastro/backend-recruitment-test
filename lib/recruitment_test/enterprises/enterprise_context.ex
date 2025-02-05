defmodule RecruitmentTest.EnterpriseContext do
  import Ecto.Query

  alias RecruitmentTest.Repo
  alias RecruitmentTest.Enterprises.Enterprise

  def get_enterprise(id), do: Repo.get(Enterprise, id)

  def list_enterprises(offset, limit) do
    query = from e in Enterprise,
          offset: ^offset,
          limit: ^limit
    Repo.all(query)
  end

  def get_total_enterprises, do: Repo.aggregate(Enterprise, :count, :id)
end
