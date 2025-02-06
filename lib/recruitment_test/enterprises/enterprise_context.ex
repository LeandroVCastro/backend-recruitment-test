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

  @spec create_enterprise(:string, :strting, :string, :string) :: {:ok, Enterprise} | {:error, Ecto.Changeset.t()}
  def create_enterprise(name, commercial_name, description, cnpj) do
    %Enterprise{}
      |> Enterprise.changeset(%{
          name: name,
          commercial_name: commercial_name,
          description: description,
          cnpj: cnpj
        })
      |> Repo.insert()
  end

end
