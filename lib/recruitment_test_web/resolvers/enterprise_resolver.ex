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

  @spec create_enterprise(nil, map(), nil) :: {:error, :string} | {:ok, RecruitmentTest.Enterprises.Enterprise}
  def create_enterprise(_, args, _) do
    name = Map.get(args, :name)
    commercial_name = Map.get(args, :commercial_name)
    description = Map.get(args, :description)
    cnpj = Map.get(args, :cnpj)
    case EnterpriseContext.create_enterprise(name, commercial_name, description, cnpj) do
      {:ok, enterprise} -> {:ok, enterprise}
      {:error, changeset} -> {:error, "Error creating Enterprise: #{inspect(changeset.errors)}"}
    end
  end
end
