defmodule RecruitmentTest.EnterpriseContext do
  import Ecto.Query
  require Logger
  alias RecruitmentTest.Repo
  alias RecruitmentTest.Enterprises.Enterprise

  def get_enterprise(id) do
    query = from e in Enterprise,
          where: is_nil(e.deleted_at)
    Repo.get(query, id)
  end

  @spec delete_enterprise(:integer) :: {:ok, Enterprise} | {:error, Ecto.Changeset.t()} | nil
  def delete_enterprise(id) do
    case get_enterprise(id) do
      nil -> nil

      enterprise -> enterprise |> Enterprise.changeset(%{
          deleted_at: DateTime.utc_now()
        })
        |> Repo.update()
    end
  end

  def list_enterprises(offset, limit) do
    query = from e in Enterprise,
          where: is_nil(e.deleted_at),
          offset: ^offset,
          limit: ^limit
    Repo.all(query)
  end

  def get_total_enterprises do
    query = from e in Enterprise,
            where: is_nil(e.deleted_at)
    Repo.aggregate(query, :count, :id)
  end

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

  @spec update_enterprise(:integer, :string, :strting, :string, :string) :: {:ok, Enterprise} | {:error, Ecto.Changeset.t()} | nil
  def update_enterprise(id, name, commercial_name, description, cnpj) do
    case get_enterprise(id) do
      nil -> nil

      enterprise -> enterprise |> Enterprise.changeset(%{
          name: name,
          commercial_name: commercial_name,
          description: description,
          cnpj: cnpj
        })
        |> Repo.update()
    end
  end

end
