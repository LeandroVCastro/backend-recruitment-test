defmodule RecruitmentTestWeb.Resolvers.HelloWorldResolver do
  def get(_parent, _args, _resolution) do
    now = DateTime.utc_now() |> DateTime.to_string()
    {:ok, %{message: "Hello World :)", now: now}}
  end
end
